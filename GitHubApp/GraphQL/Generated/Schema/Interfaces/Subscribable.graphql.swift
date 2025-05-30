// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Interfaces {
  /// Entities that can be subscribed to for web and email notifications.
  static let Subscribable = ApolloAPI.Interface(
    name: "Subscribable",
    keyFields: nil,
    implementingObjects: [
      "Commit",
      "Issue",
      "PullRequest",
      "Repository",
      "Team",
      "TeamDiscussion"
    ]
  )
}