// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a private_repository_forking.enable event.
  static let PrivateRepositoryForkingEnableAuditEntry = Object(
    typename: "PrivateRepositoryForkingEnableAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.EnterpriseAuditEntryData.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self,
      GitHubGraphQL.Interfaces.RepositoryAuditEntryData.self
    ]
  )
}