// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// An account on GitHub, with one or more owners, that has repositories, members and teams.
  static let Organization = Object(
    typename: "Organization",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.Actor.self,
      GitHubGraphQL.Interfaces.PackageOwner.self,
      GitHubGraphQL.Interfaces.ProjectOwner.self,
      GitHubGraphQL.Interfaces.ProjectV2Owner.self,
      GitHubGraphQL.Interfaces.ProjectV2Recent.self,
      GitHubGraphQL.Interfaces.RepositoryDiscussionAuthor.self,
      GitHubGraphQL.Interfaces.RepositoryDiscussionCommentAuthor.self,
      GitHubGraphQL.Interfaces.RepositoryOwner.self,
      GitHubGraphQL.Interfaces.UniformResourceLocatable.self,
      GitHubGraphQL.Interfaces.MemberStatusable.self,
      GitHubGraphQL.Interfaces.ProfileOwner.self,
      GitHubGraphQL.Interfaces.Sponsorable.self,
      GitHubGraphQL.Interfaces.AnnouncementBanner.self
    ]
  )
}