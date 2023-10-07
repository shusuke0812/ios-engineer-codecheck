// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a org.oauth_app_access_requested event.
  static let OrgOauthAppAccessRequestedAuditEntry = Object(
    typename: "OrgOauthAppAccessRequestedAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.OauthApplicationAuditEntryData.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self
    ]
  )
}