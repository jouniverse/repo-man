// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Interfaces {
  /// Comments that can be updated.
  static let UpdatableComment = ApolloAPI.Interface(
    name: "UpdatableComment",
    keyFields: nil,
    implementingObjects: [
      "CommitComment",
      "GistComment",
      "Issue",
      "IssueComment",
      "PullRequest",
      "PullRequestReview",
      "PullRequestReviewComment",
      "TeamDiscussion",
      "TeamDiscussionComment"
    ]
  )
}