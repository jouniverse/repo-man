//
//  RepositoryNode.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import Foundation
import ApolloAPI // Import for core Apollo types, potentially used by RepositoryNode or generated types

protocol RepositoryNode {
    var id: GitHubGraphQLAPI.ID { get } // Changed from ApolloAPI.GraphQLID
    var name: String { get }
    var description: String? { get }
    var stargazerCount: Int { get }
}
