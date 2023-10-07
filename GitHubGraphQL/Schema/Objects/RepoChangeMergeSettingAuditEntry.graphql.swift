// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a repo.change_merge_setting event.
  static let RepoChangeMergeSettingAuditEntry = Object(
    typename: "RepoChangeMergeSettingAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.RepositoryAuditEntryData.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self
    ]
  )
}