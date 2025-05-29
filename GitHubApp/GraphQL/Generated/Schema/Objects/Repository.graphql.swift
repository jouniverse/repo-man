// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Objects {
  /// A repository contains the content for a project.
  static let Repository = ApolloAPI.Object(
    typename: "Repository",
    implementedInterfaces: [
      GitHubGraphQLAPI.Interfaces.Node.self,
      GitHubGraphQLAPI.Interfaces.ProjectOwner.self,
      GitHubGraphQLAPI.Interfaces.PackageOwner.self,
      GitHubGraphQLAPI.Interfaces.Subscribable.self,
      GitHubGraphQLAPI.Interfaces.Starrable.self,
      GitHubGraphQLAPI.Interfaces.UniformResourceLocatable.self,
      GitHubGraphQLAPI.Interfaces.RepositoryInfo.self
    ],
    keyFields: nil
  )
}