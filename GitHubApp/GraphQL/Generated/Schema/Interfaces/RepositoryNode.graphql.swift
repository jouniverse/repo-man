// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Interfaces {
  /// Represents a object that belongs to a repository.
  static let RepositoryNode = ApolloAPI.Interface(
    name: "RepositoryNode",
    keyFields: nil,
    implementingObjects: [
      "CommitComment",
      "CommitCommentThread",
      "Issue",
      "IssueComment",
      "PullRequest",
      "PullRequestCommitCommentThread",
      "PullRequestReview",
      "PullRequestReviewComment",
      "RepositoryVulnerabilityAlert"
    ]
  )
}