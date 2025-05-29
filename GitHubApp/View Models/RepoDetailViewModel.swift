
import Foundation
import Apollo // For ApolloClient
import ApolloAPI // For GraphQLNullable, GraphQLError

class RepoDetailViewModel: ObservableObject {
    let owner: String
    let repoName: String

    @Published var readmeContent: String?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    init(owner: String, repoName: String) {
        self.owner = owner
        self.repoName = repoName
        print("RepoDetailViewModel initialized for \(owner)/\(repoName)")
    }

    func fetchReadme() {
        print("fetchReadme called for \(self.owner)/\(self.repoName)")
        self.isLoading = true
        self.errorMessage = nil
        self.readmeContent = nil // Clear previous content

        Network.shared.apollo.fetch(query: GitHubGraphQLAPI.GetReadmeForRepositoryQuery(owner: self.owner, name: self.repoName)) { [weak self] result in
            guard let self = self else { return }

            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("fetchReadme completed. isLoading: \(self.isLoading), readmeContent exists: \(self.readmeContent != nil), errorMessage: \(String(describing: self.errorMessage))")
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

                guard let data = graphQLResult.data else {
                    print("Successfully fetched, but data is nil.")
                    DispatchQueue.main.async {
                        self.errorMessage = "No data received"
                    }
                    return
                }
                
                if let text = data.repository?.readme?.asBlob?.text {
                    print("Successfully fetched README. Text length: \(text.count)")
                    DispatchQueue.main.async {
                        self.readmeContent = text
                    }
                } else {
                    print("Successfully fetched, but README text is nil or not a Blob.")
                    DispatchQueue.main.async {
                        // self.readmeContent = nil // Already nil or could set a specific message
                        // self.errorMessage = "README content not found or not in expected format." // Optional: set error if nil text is an error
                    }
                }

            case .failure(let error):
                print("Failed to fetch README. Network Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
