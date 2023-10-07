// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL.Unions {
  /// The results of a search.
  static let SearchResultItem = Union(
    name: "SearchResultItem",
    possibleTypes: [
      GitHubGraphQL.Objects.App.self,
      GitHubGraphQL.Objects.Discussion.self,
      GitHubGraphQL.Objects.Issue.self,
      GitHubGraphQL.Objects.MarketplaceListing.self,
      GitHubGraphQL.Objects.Organization.self,
      GitHubGraphQL.Objects.PullRequest.self,
      GitHubGraphQL.Objects.Repository.self,
      GitHubGraphQL.Objects.User.self
    ]
  )
}