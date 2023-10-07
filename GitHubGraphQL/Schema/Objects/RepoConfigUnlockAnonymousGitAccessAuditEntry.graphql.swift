// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// Audit log entry for a repo.config.unlock_anonymous_git_access event.
  static let RepoConfigUnlockAnonymousGitAccessAuditEntry = Object(
    typename: "RepoConfigUnlockAnonymousGitAccessAuditEntry",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.AuditEntry.self,
      GitHubGraphQL.Interfaces.OrganizationAuditEntryData.self,
      GitHubGraphQL.Interfaces.RepositoryAuditEntryData.self
    ]
  )
}