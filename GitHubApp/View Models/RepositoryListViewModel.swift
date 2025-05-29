//
//  RepositoryListViewModel.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import Foundation
import ApolloAPI

enum RepositoriesDisplay {
    case latest
    case top
}

class RepositoryListViewModel: ObservableObject {
    
    @Published var respositories: [RepositoryViewModel] = []
    @Published var repositoriesDisplay: RepositoriesDisplay = .latest
    
    func getTopRepositoriesForUser(username: String) {
        
        Network.shared.apollo.fetch(query: GitHubGraphQLAPI.GetTopRepositoriesForUserQuery(username: username)) { result in
            switch result {
                case .success(let graphQLResult):
                   
                    guard let data = graphQLResult.data,
                          let user = data.user,
                          let nodes = user.repositories.nodes
                          else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.respositories = nodes.compactMap { $0 }.map(RepositoryViewModel.init)
                    }
                    
                case .failure(let error):
                    print(error)
            }
        }
        
    }
    
    
    func getLatestRepositoriesForUser(username: String) {
        
        Network.shared.apollo.fetch(query: GitHubGraphQLAPI.GetRepositoriesByUserNameQuery(username: username)) { result in
            switch result {
                case .success(let graphQLResult):
                   
                    guard let data = graphQLResult.data,
                          let user = data.user,
                          let nodes = user.repositories.nodes
                          else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.respositories = nodes.compactMap { $0 }.map(RepositoryViewModel.init)
                    }
                    
                case .failure(let error):
                    print(error)
            }
            
        }
        
    }
    
}

struct RepositoryViewModel {
    
    let node: RepositoryNode
    
    var hasRating: Bool {
        node.stargazerCount > 0
    }
    
    var id: GitHubGraphQLAPI.ID { // Changed from ApolloAPI.GraphQLID
        node.id
    }
    
    var name: String {
        node.name
    }
    
    var description: String {
        node.description ?? ""
    }
    
    var starCount: Int {
        node.stargazerCount
    }
    
}
