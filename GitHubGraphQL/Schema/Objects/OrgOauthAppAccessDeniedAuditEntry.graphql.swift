// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a org.oauth_app_access_denied event.
  static let OrgOauthAppAccessDeniedAuditEntry = Object(
    typename: "OrgOauthAppAccessDeniedAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.OauthApplicationAuditEntryData.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self
    ]
  )
}