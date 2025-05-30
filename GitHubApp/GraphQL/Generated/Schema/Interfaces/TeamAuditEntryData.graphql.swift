// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Interfaces {
  /// Metadata for an audit entry with action team.*
  static let TeamAuditEntryData = ApolloAPI.Interface(
    name: "TeamAuditEntryData",
    keyFields: nil,
    implementingObjects: [
      "OrgRestoreMemberMembershipTeamAuditEntryData",
      "TeamAddMemberAuditEntry",
      "TeamAddRepositoryAuditEntry",
      "TeamChangeParentTeamAuditEntry",
      "TeamRemoveMemberAuditEntry",
      "TeamRemoveRepositoryAuditEntry"
    ]
  )
}