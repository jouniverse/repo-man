import Foundation
import Apollo
import ApolloAPI

struct TreeEntry: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let type: String // "blob" for file, "tree" for directory
    let oid: String
    let path: String // Full path of the entry
}

class CodeTreeViewModel: ObservableObject {
    let owner: String
    let repoName: String
    @Published var currentPath: String
    
    @Published var entries: [TreeEntry] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    init(owner: String, repoName: String, path: String = "HEAD:") { // Default to root
        self.owner = owner
        self.repoName = repoName
        self.currentPath = path
        print("CodeTreeViewModel initialized for \(owner)/\(repoName) at path: \(path)")
    }

    func fetchTree(path: String? = nil) {
        let pathToFetch = path ?? self.currentPath
        print("fetchTree called for \(self.owner)/\(self.repoName), path: \(pathToFetch)")
        self.isLoading = true
        self.errorMessage = nil
        // self.entries = [] // Clear previous entries when fetching a new path

        // Use the GraphQL expression for the path. For root, it's typically "HEAD:"
        // For subdirectories, it would be "HEAD:directoryName" or "BRANCH_NAME:directoryName/subdirectoryName"
        // The GetRepositoryTreeQuery expects an expression like "BRANCH:PATH"
        // For simplicity, we'll assume "HEAD" as the branch for now.
        // If path is "HEAD:", it means root. If it's "src", the expression should be "HEAD:src"
        
        let expression: String
        if pathToFetch == "HEAD:" || pathToFetch.isEmpty {
            expression = "HEAD:" // Root directory
        } else {
            // Ensure path doesn't start with "HEAD:" if it's already a subpath
            let cleanPath = pathToFetch.starts(with: "HEAD:") ? String(pathToFetch.dropFirst("HEAD:".count)) : pathToFetch
            expression = "HEAD:\(cleanPath)"
        }
        
        print("Fetching tree with expression: \(expression)")

        // Wrap the path expression with GraphQLNullable.some() as the generated query likely expects it.
        Network.shared.apollo.fetch(query: GitHubGraphQLAPI.GetRepositoryTreeQuery(owner: self.owner, name: self.repoName, path: GraphQLNullable.some(expression))) { [weak self] result in
            guard let self = self else { return }

            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("fetchTree completed. isLoading: \(self.isLoading), entries count: \(self.entries.count), errorMessage: \(String(describing: self.errorMessage))")
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
                    print("Successfully fetched tree, but data is nil.")
                    DispatchQueue.main.async {
                        self.errorMessage = "No data received for tree."
                        self.entries = []
                    }
                    return
                }

                if let treeObject = data.repository?.object?.asTree {
                    print("Successfully fetched tree with \(treeObject.entries?.count ?? 0) entries.")
                    DispatchQueue.main.async {
                        // The `entries` array itself might be optional, but compactMap handles that.
                        // If `entry` within the closure is non-optional (as the error suggests),
                        // access its properties directly.
                        self.entries = treeObject.entries?.compactMap { entry -> TreeEntry? in
                            // Assuming `entry` itself is non-optional here based on the error message.
                            // If `treeObject.entries` was `[Entry?]`, then `entry` would be `Entry?`
                            // and `entry?.name` would be correct.
                            // Given the error, `entry` is `Entry`, so direct access is needed.
                            let name = entry.name
                            let type = entry.type
                            let oid = entry.oid
                            
                            let basePath = self.currentPath == "HEAD:" ? "" : String(self.currentPath.dropFirst("HEAD:".count))
                            let entryPath = basePath.isEmpty ? name : "\(basePath)/\(name)"
                            return TreeEntry(name: name, type: type, oid: oid, path: entryPath)
                        } ?? []
                        // Sort entries: directories first, then files, all alphabetically
                        self.entries.sort {
                            if $0.type != $1.type {
                                return $0.type == "tree" // "tree" comes before "blob"
                            }
                            return $0.name.lowercased() < $1.name.lowercased()
                        }
                    }
                } else {
                    print("Successfully fetched, but object is not a Tree or has no entries.")
                     DispatchQueue.main.async {
                        self.errorMessage = "Could not load directory contents."
                        self.entries = []
                    }
                }

            case .failure(let error):
                print("Failed to fetch tree. Network Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.entries = []
                }
            }
        }
    }
    
    func navigate(to entry: TreeEntry) {
        if entry.type == "tree" {
            // It's a directory, update currentPath and fetch new tree
            // The entry.path is relative to the repo root (e.g., "src" or "src/components")
            // The expression for the query needs to be "HEAD:src" or "HEAD:src/components"
            self.currentPath = "HEAD:\(entry.path)"
            self.entries = [] // Clear old entries immediately
            fetchTree()
        } else {
            // It's a file (blob), handle file viewing (to be implemented)
            print("Selected file: \(entry.name) with OID: \(entry.oid) at path \(entry.path)")
            // We'll implement file content fetching later
        }
    }
}
