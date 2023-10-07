// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a team.add_repository event.
  static let TeamAddRepositoryAuditEntry = Object(
    typename: "TeamAddRepositoryAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self,
      GitHubGraphQL.Interfaces.RepositoryAuditEntryData.self,
      GitHubGraphQL.Interfaces.TeamAuditEntryData.self
    ]
  )
}