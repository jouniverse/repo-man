// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Interfaces {
  /// Metadata for an audit entry containing enterprise account information.
  static let EnterpriseAuditEntryData = ApolloAPI.Interface(
    name: "EnterpriseAuditEntryData",
    keyFields: nil,
    implementingObjects: [
      "MembersCanDeleteReposClearAuditEntry",
      "MembersCanDeleteReposDisableAuditEntry",
      "MembersCanDeleteReposEnableAuditEntry",
      "OrgInviteToBusinessAuditEntry",
      "PrivateRepositoryForkingDisableAuditEntry",
      "PrivateRepositoryForkingEnableAuditEntry",
      "RepositoryVisibilityChangeDisableAuditEntry",
      "RepositoryVisibilityChangeEnableAuditEntry"
    ]
  )
}