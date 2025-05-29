import Foundation
import UIKit
import Apollo // For ApolloClient
import ApolloAPI // For GraphQLNullable, GraphQLError
import Highlightr // Import Highlightr

class FileContentViewModel: ObservableObject {
    let owner: String
    let repoName: String
    let fileOid: String
    let fileName: String

    @Published var fileContent: String? // Keep raw content if needed
    @Published var highlightedAttributedText: NSAttributedString? // For highlighted text
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isBinary: Bool = false

    init(owner: String, repoName: String, fileOid: String, fileName: String) {
        self.owner = owner
        self.repoName = repoName
        self.fileOid = fileOid
        self.fileName = fileName
        print("FileContentViewModel initialized for \(owner)/\(repoName)/\(fileName) with OID \(fileOid)")
    }

    func fetchFileContent() {
        print("fetchFileContent called for \(self.owner)/\(self.repoName)/\(self.fileName)")
        self.isLoading = true
        self.errorMessage = nil
        self.fileContent = nil // Clear previous raw content
        self.highlightedAttributedText = nil // Clear previous highlighted content
        self.isBinary = false // Reset binary flag

        Network.shared.apollo.fetch(query: GitHubGraphQLAPI.GetBlobContentQuery(owner: self.owner, name: self.repoName, oid: self.fileOid)) { [weak self] result in
            guard let self = self else { return }

            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("fetchFileContent completed. isLoading: \(self.isLoading), highlightedAttributedText exists: \(self.highlightedAttributedText != nil), isBinary: \(self.isBinary), errorMessage: \(String(describing: self.errorMessage))")
                }
            }

            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    let message = errors.map { $0.localizedDescription }.joined(separator: "\n")
                    print("GraphQL Errors: \(message)")
                    DispatchQueue.main.async {
                        self.errorMessage = message
                    }
                    return
                }

                guard let data = graphQLResult.data, let object = data.repository?.object?.asBlob else {
                    print("Successfully fetched, but data or blob object is nil.")
                    DispatchQueue.main.async {
                        self.errorMessage = "No data or blob object received"
                    }
                    return
                }

                if object.isBinary == true {
                    print("File is binary.")
                    DispatchQueue.main.async {
                        self.isBinary = true
                    }
                    return
                }
                
                if let text = object.text {
                    print("Successfully fetched file content. Text length: \(text.count)")
                    DispatchQueue.main.async {
                        self.fileContent = text // Store raw text

                        let highlightr = Highlightr()
                        highlightr!.setTheme(to: "tomorrow") // Or any other theme e.g. "xcode", "github"
                        
                        let fileExtension = (self.fileName as NSString).pathExtension
                        var attributedTextToProcess: NSAttributedString
                        
                        if let highlighted = highlightr!.highlight(text, as: fileExtension.lowercased(), fastRender: true) {
                            print("Highlighting successful for language: \(fileExtension.lowercased())")
                            attributedTextToProcess = highlighted
                        } else {
                            print("Highlighting failed or language '\(fileExtension.lowercased())' not supported. Falling back to plain text.")
                            #if canImport(UIKit)
                            let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize, weight: .regular)]
                            attributedTextToProcess = NSAttributedString(string: text, attributes: attributes)
                            #else
                            attributedTextToProcess = NSAttributedString(string: text)
                            #endif
                        }

                        // Add line numbers
                        let finalAttributedTextWithLineNumbers = NSMutableAttributedString()
                        let plainTextForLineCounting = attributedTextToProcess.string
                        var lineNumber = 1
                        
                        let lineNumberFont: UIFont
                        #if canImport(UIKit)
                        lineNumberFont = UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize * 0.85, weight: .regular) // Slightly smaller font
                        #else
                        lineNumberFont = UIFont.systemFont(ofSize: 10) // Fallback
                        #endif

                        let lineNumberAttributes: [NSAttributedString.Key: Any] = [
                            .font: lineNumberFont,
                            NSAttributedString.Key.foregroundColor: UIColor.gray // Line numbers in gray
                        ]
                        
                        var currentPositionInPlainText = plainTextForLineCounting.startIndex
                        // Loop as long as there's content to process
                        while currentPositionInPlainText < plainTextForLineCounting.endIndex {
                            let nextNewline = plainTextForLineCounting[currentPositionInPlainText...].firstIndex(of: "\n") ?? plainTextForLineCounting.endIndex
                            
                            // Line number prefix
                            let prefixString = String(format: "%3d | ", lineNumber)
                            let prefixAttributedString = NSAttributedString(string: prefixString, attributes: lineNumberAttributes)
                            finalAttributedTextWithLineNumbers.append(prefixAttributedString)
                            
                            // Attributed line content
                            let startOffset = plainTextForLineCounting.distance(from: plainTextForLineCounting.startIndex, to: currentPositionInPlainText)
                            let length = plainTextForLineCounting.distance(from: currentPositionInPlainText, to: nextNewline)
                            let attributedLine = attributedTextToProcess.attributedSubstring(from: NSRange(location: startOffset, length: length))
                            finalAttributedTextWithLineNumbers.append(attributedLine)
                            
                            lineNumber += 1 // Increment for the next potential line

                            if nextNewline < plainTextForLineCounting.endIndex {
                                // This line had a newline character, so append it
                                finalAttributedTextWithLineNumbers.append(NSAttributedString(string: "\n"))
                                // Move past the newline character for the next iteration
                                currentPositionInPlainText = plainTextForLineCounting.index(after: nextNewline)
                            } else {
                                // This was the last line (no newline after it), or an empty string that reached here.
                                // Set currentPositionInPlainText to endIndex to terminate the loop.
                                currentPositionInPlainText = nextNewline
                            }
                        }
                        
                        // If the original text was empty, add a single line number for an empty line
                        if plainTextForLineCounting.isEmpty {
                            // Ensure lineNumber is 1 if it hasn't been incremented
                            let currentLineNumber = (lineNumber == 1 && finalAttributedTextWithLineNumbers.length == 0) ? 1 : lineNumber
                            let prefixString = String(format: "%3d | ", currentLineNumber)
                            let prefixAttributedString = NSAttributedString(string: prefixString, attributes: lineNumberAttributes)
                            finalAttributedTextWithLineNumbers.append(prefixAttributedString)
                        }

                        self.highlightedAttributedText = finalAttributedTextWithLineNumbers
                    }
                } else {
                    print("Successfully fetched, but file text is nil (and not binary).")
                    DispatchQueue.main.async {
                        // self.errorMessage = "File content is empty." // Or handle in view
                    }
                }

            case .failure(let error):
                print("Failed to fetch file content. Network Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
