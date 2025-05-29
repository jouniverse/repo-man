import SwiftUI

struct CodeTreeView: View {
    let owner: String
    let repoName: String

    @StateObject private var viewModel: CodeTreeViewModel

    init(owner: String, repoName: String, path: String = "HEAD:") {
        self.owner = owner
        self.repoName = repoName
        _viewModel = StateObject(wrappedValue: CodeTreeViewModel(owner: owner, repoName: repoName, path: path))
    }

    var body: some View {
        VStack { // Main VStack
            // Text("Files for \(repoName)") // Title is now in navigationBar
            //     .font(.largeTitle)
            // Text("Owned by: \(owner)")
            //     .font(.headline)
            
            if viewModel.isLoading {
                ProgressView("Loading files...") // Added label
            } else if let errorMessage = viewModel.errorMessage { // Added error message display
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else if viewModel.entries.isEmpty {
                Text("No files or directories found in this path.")
                    .padding()
            } else {
                List(viewModel.entries) { entry in
                    if entry.type == "blob" { // It's a file
                        NavigationLink(destination: FileContentView(owner: owner, repoName: repoName, fileName: entry.name, fileOid: entry.oid)) {
                            HStack {
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.gray)
                                Text(entry.name)
                                    .foregroundColor(.primary)
                            }
                        }
                    } else { // It's a directory (tree)
                        Button(action: {
                            viewModel.navigate(to: entry)
                        }) {
                            HStack {
                                Image(systemName: "folder.fill")
                                    .foregroundColor(.accentColor)
                                Text(entry.name)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
            }
            // Spacer() // Spacer might not be needed if List fills the space
        }
        .navigationTitle(titleForPath()) // Restored dynamic title
        // .padding() // Padding might be excessive if List handles its own
        .onAppear { // ADDED .onAppear
            print("CodeTreeView: .onAppear called. Fetching tree for \(owner)/\(repoName) at path \(viewModel.currentPath)")
            viewModel.fetchTree()
        }
    }
    
    private func titleForPath() -> String {
        let pathComponent = viewModel.currentPath.replacingOccurrences(of: "HEAD:", with: "")
        if pathComponent.isEmpty {
            return repoName // Root
        } else {
            // Ensure no leading slash if pathComponent was empty before
            let displayPath = pathComponent.first == "/" ? String(pathComponent.dropFirst()) : pathComponent
            return displayPath.isEmpty ? repoName : "\(repoName)/\(displayPath)"
        }
    }
}

struct CodeTreeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CodeTreeView(owner: "previewOwner", repoName: "PreviewRepo")
        }
    }
}
