// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a repo.access event.
  static let RepoAccessAuditEntry = Object(
    typename: "RepoAccessAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self,
      GitHubGraphQL.Interfaces.RepositoryAuditEntryData.self
    ]
  )
}