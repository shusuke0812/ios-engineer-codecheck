// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// A review comment associated with a given repository pull request.
  static let PullRequestReviewComment = Object(
    typename: "PullRequestReviewComment",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.Comment.self,
      GitHubGraphQL.Interfaces.Deletable.self,
      GitHubGraphQL.Interfaces.Minimizable.self,
      GitHubGraphQL.Interfaces.Updatable.self,
      GitHubGraphQL.Interfaces.UpdatableComment.self,
      GitHubGraphQL.Interfaces.Reactable.self,
      GitHubGraphQL.Interfaces.RepositoryNode.self
    ]
  )
}