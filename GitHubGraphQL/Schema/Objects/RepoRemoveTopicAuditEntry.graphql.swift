// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a repo.remove_topic event.
  static let RepoRemoveTopicAuditEntry = Object(
    typename: "RepoRemoveTopicAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.RepositoryAuditEntryData.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self,
      GitHubGraphQL.Interfaces.TopicAuditEntryData.self
    ]
  )
}