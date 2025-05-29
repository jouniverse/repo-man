//
//  AddRepositoryViewModel.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import Foundation
import Combine // For @Published
import ApolloAPI // For base Apollo types, good practice
// DO NOT import GitHubGraphQLAPI

class AddRepositoryViewModel: ObservableObject {
    
    var name: String = ""
    var description: String = ""
    // Use namespaced generated enum
    var visibility: GitHubGraphQLAPI.RepositoryVisibility = .public
    @Published var errors: [ErrorViewModel] = []
    
    func saveRepository(completion: @escaping () -> Void) {
         
        self.errors = []
        let clientMutationId = UUID().uuidString // Assuming this is a non-nullable String in your mutation input

        // Apply GraphQLEnum and GraphQLNullable wrappers
        Network.shared.apollo.perform(mutation: GitHubGraphQLAPI.CreateRepositoryMutation(
                    name: name, // Pass directly as it's non-nullable String
                    description: GraphQLNullable.some(description), // Correct
                    visibility: GraphQLEnum(visibility), // Correct
                    clientMutationId: GraphQLNullable.some(clientMutationId) // Correct
                )) { result in
            
            switch result {
                case .success(let graphQLResult):
                    if let errors = graphQLResult.errors {
                        DispatchQueue.main.async {
                            self.errors = errors.map {
                                // Handle optional $0.message for ErrorViewModel
                                ErrorViewModel(message: $0.message ?? "Unknown GraphQL error")
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion()
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.errors = [ErrorViewModel(message: error.localizedDescription)]
                    }
            }
            
            
        }
        
        
    }
}
