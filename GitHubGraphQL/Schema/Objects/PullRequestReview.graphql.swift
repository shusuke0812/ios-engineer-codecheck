// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// A review object for a given pull request.
  static let PullRequestReview = Object(
    typename: "PullRequestReview",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.Comment.self,
      GitHubGraphQL.Interfaces.Deletable.self,
      GitHubGraphQL.Interfaces.Updatable.self,
      GitHubGraphQL.Interfaces.UpdatableComment.self,
      GitHubGraphQL.Interfaces.Reactable.self,
      GitHubGraphQL.Interfaces.RepositoryNode.self
    ]
  )
}