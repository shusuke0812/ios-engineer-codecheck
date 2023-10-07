// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// A comment on a discussion.
  static let DiscussionComment = Object(
    typename: "DiscussionComment",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Comment.self,
      GitHubGraphQL.Interfaces.Deletable.self,
      GitHubGraphQL.Interfaces.Minimizable.self,
      GitHubGraphQL.Interfaces.Updatable.self,
      GitHubGraphQL.Interfaces.UpdatableComment.self,
      GitHubGraphQL.Interfaces.Reactable.self,
      GitHubGraphQL.Interfaces.Votable.self,
      GitHubGraphQL.Interfaces.Node.self
    ]
  )
}