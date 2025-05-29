import SwiftUI

struct FileContentView: View {
    let owner: String
    let repoName: String
    let fileName: String
    let fileOid: String // Git Object ID for the file blob

    @StateObject private var viewModel: FileContentViewModel

    init(owner: String, repoName: String, fileName: String, fileOid: String) {
        self.owner = owner
        self.repoName = repoName
        self.fileName = fileName
        self.fileOid = fileOid
        // Initialize the StateObject, now passing fileName
        _viewModel = StateObject(wrappedValue: FileContentViewModel(owner: owner, repoName: repoName, fileOid: fileOid, fileName: fileName))
    }

    var body: some View {
        VStack(alignment: .leading) {
            // Header information (file name, path) is now primarily in the navigation title
            
            if viewModel.isLoading {
                ProgressView("Loading content...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else if viewModel.isBinary {
                Text("Cannot display binary file content.")
                    .padding()
            } else if let attributedText = viewModel.highlightedAttributedText { // Check for highlighted text first
                ScrollView {
                    Text(AttributedString(attributedText)) // Display the NSAttributedString
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                // apply rounded corners and shadow to the ScrollView
                 .cornerRadius(20)
                // .shadow(radius: 5)
                // white border around the ScrollView
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            } else if let plainContent = viewModel.fileContent { // Fallback to plain text if no attributed string yet
                ScrollView {
                    Text(plainContent)
                        .font(Font.system(.body, design: .monospaced)) // Use a monospaced font for code
                        .frame(maxWidth: .infinity, alignment: .leading) // Ensure text aligns left
                        .padding()
                }
                // apply rounded corners and shadow to the ScrollView
                .cornerRadius(20)
                // .shadow(radius: 5)
                // white border around the ScrollView
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            } else {
                Text("No content found or file is empty.")
                    .padding()
            }
        }
        .navigationTitle(fileName) // Display file name as title
        .onAppear {
            print("FileContentView: .onAppear called for \(fileName) with OID \(fileOid)")
            viewModel.fetchFileContent() // Removed fileName argument as ViewModel now stores it
        }
    }
}

struct FileContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FileContentView(owner: "previewOwner",
                            repoName: "PreviewRepo",
                            fileName: "example.swift",
                            fileOid: "abcdef1234567890")
        }
    }
}
