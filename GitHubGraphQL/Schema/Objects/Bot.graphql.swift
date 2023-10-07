// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// A special type of user which takes actions on behalf of GitHub Apps.
  static let Bot = Object(
    typename: "Bot",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.Actor.self,
      GitHubGraphQL.Interfaces.UniformResourceLocatable.self
    ]
  )
}