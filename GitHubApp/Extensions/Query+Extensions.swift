//
//  Query+Extensions.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import Foundation
import ApolloAPI // Import for core Apollo types, potentially used by RepositoryNode or generated types

// Use the fully namespaced generated types
extension GitHubGraphQLAPI.GetRepositoriesByUserNameQuery.Data.User.Repositories.Node: RepositoryNode { }
extension GitHubGraphQLAPI.GetTopRepositoriesForUserQuery.Data.User.Repositories.Node: RepositoryNode { }
