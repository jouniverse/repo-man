// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQLAPI.Objects {
  /// Audit log entry for a org.oauth_app_access_denied event.
  static let OrgOauthAppAccessDeniedAuditEntry = ApolloAPI.Object(
    typename: "OrgOauthAppAccessDeniedAuditEntry",
    implementedInterfaces: [
      GitHubGraphQLAPI.Interfaces.Node.self,
      GitHubGraphQLAPI.Interfaces.AuditEntry.self,
      GitHubGraphQLAPI.Interfaces.OauthApplicationAuditEntryData.self,
      GitHubGraphQLAPI.Interfaces.OrganizationAuditEntryData.self
    ],
    keyFields: nil
  )
}