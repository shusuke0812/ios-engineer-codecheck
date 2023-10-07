// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Objects {
  /// A repository contains the content for a project.
  static let Repository = Object(
    typename: "Repository",
    implementedInterfaces: [
      GitHubGraphQL.Interfaces.Node.self,
      GitHubGraphQL.Interfaces.ProjectV2Recent.self,
      GitHubGraphQL.Interfaces.ProjectOwner.self,
      GitHubGraphQL.Interfaces.PackageOwner.self,
      GitHubGraphQL.Interfaces.Subscribable.self,
      GitHubGraphQL.Interfaces.Starrable.self,
      GitHubGraphQL.Interfaces.UniformResourceLocatable.self,
      GitHubGraphQL.Interfaces.RepositoryInfo.self
    ]
  )
}