// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Objects {
  /// An account on GitHub, with one or more owners, that has repositories, members and teams.
  static let Organization = ApolloAPI.Object(
    typename: "Organization",
    implementedInterfaces: [
      GitHubGraphQLAPI.Interfaces.Node.self,
      GitHubGraphQLAPI.Interfaces.Actor.self,
      GitHubGraphQLAPI.Interfaces.PackageOwner.self,
      GitHubGraphQLAPI.Interfaces.ProjectOwner.self,
      GitHubGraphQLAPI.Interfaces.RepositoryOwner.self,
      GitHubGraphQLAPI.Interfaces.UniformResourceLocatable.self,
      GitHubGraphQLAPI.Interfaces.MemberStatusable.self,
      GitHubGraphQLAPI.Interfaces.ProfileOwner.self,
      GitHubGraphQLAPI.Interfaces.Sponsorable.self
    ],
    keyFields: nil
  )
}