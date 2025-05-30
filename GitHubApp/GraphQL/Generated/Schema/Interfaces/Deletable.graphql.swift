// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Interfaces {
  /// Entities that can be deleted.
  static let Deletable = ApolloAPI.Interface(
    name: "Deletable",
    keyFields: nil,
    implementingObjects: [
      "CommitComment",
      "GistComment",
      "IssueComment",
      "PullRequestReview",
      "PullRequestReviewComment",
      "TeamDiscussion",
      "TeamDiscussionComment"
    ]
  )
}