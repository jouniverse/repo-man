import SwiftUI
import MarkdownUI // Import the new library

// Define MockRepositoryNode outside of RepoDetailView_Previews, as fileprivate
fileprivate struct MockRepositoryNodeForPreview: RepositoryNode {
    var id: GitHubGraphQLAPI.ID = "mockId-preview"
    var name: String = "Mock Repo Preview"
    var description: String? = "This is a mock repository for preview purposes."
    var stargazerCount: Int = 123
}

struct RepoDetailView: View {
    let repository: RepositoryViewModel
    let owner: String // To be used for fetching README

    // Add StateObject for the ViewModel
    @StateObject private var viewModel: RepoDetailViewModel

    // Update initializer
    init(repository: RepositoryViewModel, owner: String) {
        self.repository = repository
        self.owner = owner
        // Initialize the StateObject with the necessary parameters
        _viewModel = StateObject(wrappedValue: RepoDetailViewModel(owner: owner, repoName: repository.name))
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.largeTitle)
                // Add red color to the name
                // .foregroundColor(.red) // Use a red color for the name
                .padding(.bottom)
            
            Text(repository.description)
                .font(.title3)
                .padding(.bottom)
            
            HStack {
                Text("Stars: \(repository.starCount)")
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            // Divider().padding(.vertical)
            Divider()

            // Display content based on ViewModel state
            if viewModel.isLoading {
                ProgressView("Loading README...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else if let readmeContent = viewModel.readmeContent, !readmeContent.isEmpty {
                ScrollView {
                    Markdown(readmeContent) // Use MarkdownUI's Markdown view
                        .markdownTheme(.gitHub) // Optional: Apply a theme, .gitHub is a good start
                }
                .overlay(
                    Rectangle()
                        .frame(width: nil, height: 1, alignment: .top)
                        .foregroundColor(Color.gray),
                    alignment: .top
                )
                .overlay(
                    Rectangle()
                        .frame(width: nil, height: 1, alignment: .bottom)
                        .foregroundColor(Color.gray),
                    alignment: .bottom
                )
            } else {
                Text("No README found or content is empty.")
            }
            
            Spacer()

            // NavigationLink to browse code
            NavigationLink(destination: CodeTreeView(owner: owner, repoName: repository.name)) {
                Text("Browse Code")
                    .padding()
                    .frame(maxWidth: .infinity)
                // Browse button color
                    .background(Color(red: 0.18, green: 0.18, blue: 0.18)) // Use a blue color with some opacity
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 0.18, green: 0.18, blue: 0.18), lineWidth: 1)
                    )
            }
            .padding(.top) // Add some space above the button

        }
        .padding()
        .navigationTitle(repository.name)
        .onAppear {
            print("RepoDetailView: .onAppear called. Fetching README for \(owner)/\(repository.name)...")
            viewModel.fetchReadme()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock RepositoryViewModel for the preview
        // Ensure MockRepositoryNodeForPreview is defined as in the previous correct version
        let mockRepoNode = MockRepositoryNodeForPreview(name: "Preview Repo", description: "Description for preview.", stargazerCount: 42)
        let mockRepoViewModel = RepositoryViewModel(node: mockRepoNode)
        
        NavigationView { // Wrap in NavigationView for previewing navigation-dependent elements
            RepoDetailView(repository: mockRepoViewModel, owner: "previewOwner")
        }
    }
}
