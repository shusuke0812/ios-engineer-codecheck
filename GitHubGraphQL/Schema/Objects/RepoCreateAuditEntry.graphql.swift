// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a repo.create event.
  static let RepoCreateAuditEntry = Object(
    typename: "RepoCreateAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.RepositoryAuditEntryData.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self
    ]
  )
}