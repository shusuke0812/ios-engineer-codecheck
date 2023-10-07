// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GitHubGraphQL {
  /// Represents the individual results of a search.
  enum SearchType: String, EnumType {
    /// Returns results matching issues in repositories.
    case issue = "ISSUE"
    /// Returns results matching repositories.
    case repository = "REPOSITORY"
    /// Returns results matching users and organizations on GitHub.
    case user = "USER"
    /// Returns matching discussions in repositories.
    case discussion = "DISCUSSION"
  }

}