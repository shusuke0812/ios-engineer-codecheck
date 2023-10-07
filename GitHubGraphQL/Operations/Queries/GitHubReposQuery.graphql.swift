// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GitHubGraphQL {
  class GitHubReposQuery: GraphQLQuery {
    static let operationName: String = "GitHubRepos"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GitHubRepos($query: String!, $type: SearchType!, $first: Int, $last: Int, $before: String, $after: String) { search( query: $query type: $type first: $first last: $last before: $before after: $after ) { __typename repositoryCount nodes { __typename ... on Repository { name nameWithOwner languages { __typename nodes { __typename ... on Language { name color } } } stargazerCount forkCount description watchers { __typename totalCount } homepageUrl updatedAt owner { __typename avatarUrl login } } } pageInfo { __typename startCursor endCursor hasNextPage hasPreviousPage } } }"#
      ))

    public var query: String
    public var type: GraphQLEnum<SearchType>
    public var first: GraphQLNullable<Int>
    public var last: GraphQLNullable<Int>
    public var before: GraphQLNullable<String>
    public var after: GraphQLNullable<String>

    public init(
      query: String,
      type: GraphQLEnum<SearchType>,
      first: GraphQLNullable<Int>,
      last: GraphQLNullable<Int>,
      before: GraphQLNullable<String>,
      after: GraphQLNullable<String>
    ) {
      self.query = query
      self.type = type
      self.first = first
      self.last = last
      self.before = before
      self.after = after
    }

    public var __variables: Variables? { [
      "query": query,
      "type": type,
      "first": first,
      "last": last,
      "before": before,
      "after": after
    ] }

    struct Data: GitHubGraphQL.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("search", Search.self, arguments: [
          "query": .variable("query"),
          "type": .variable("type"),
          "first": .variable("first"),
          "last": .variable("last"),
          "before": .variable("before"),
          "after": .variable("after")
        ]),
      ] }

      /// Perform a search across resources, returning a maximum of 1,000 results.
      var search: Search { __data["search"] }

      /// Search
      ///
      /// Parent Type: `SearchResultItemConnection`
      struct Search: GitHubGraphQL.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.SearchResultItemConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("repositoryCount", Int.self),
          .field("nodes", [Node?]?.self),
          .field("pageInfo", PageInfo.self),
        ] }

        /// The total number of repositories that matched the search query. Regardless of the total number of matches, a maximum of 1,000 results will be available across all types.
        var repositoryCount: Int { __data["repositoryCount"] }
        /// A list of nodes.
        var nodes: [Node?]? { __data["nodes"] }
        /// Information to aid in pagination.
        var pageInfo: PageInfo { __data["pageInfo"] }

        /// Search.Node
        ///
        /// Parent Type: `SearchResultItem`
        struct Node: GitHubGraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Unions.SearchResultItem }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsRepository.self),
          ] }

          var asRepository: AsRepository? { _asInlineFragment() }

          /// Search.Node.AsRepository
          ///
          /// Parent Type: `Repository`
          struct AsRepository: GitHubGraphQL.InlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = GitHubReposQuery.Data.Search.Node
            static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Repository }
            static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("nameWithOwner", String.self),
              .field("languages", Languages?.self),
              .field("stargazerCount", Int.self),
              .field("forkCount", Int.self),
              .field("description", String?.self),
              .field("watchers", Watchers.self),
              .field("homepageUrl", GitHubGraphQL.URI?.self),
              .field("updatedAt", GitHubGraphQL.DateTime.self),
              .field("owner", Owner.self),
            ] }

            /// The name of the repository.
            var name: String { __data["name"] }
            /// The repository's name with owner.
            var nameWithOwner: String { __data["nameWithOwner"] }
            /// A list containing a breakdown of the language composition of the repository.
            var languages: Languages? { __data["languages"] }
            /// Returns a count of how many stargazers there are on this object
            ///
            var stargazerCount: Int { __data["stargazerCount"] }
            /// Returns how many forks there are of this repository in the whole network.
            var forkCount: Int { __data["forkCount"] }
            /// The description of the repository.
            var description: String? { __data["description"] }
            /// A list of users watching the repository.
            var watchers: Watchers { __data["watchers"] }
            /// The repository's URL.
            var homepageUrl: GitHubGraphQL.URI? { __data["homepageUrl"] }
            /// Identifies the date and time when the object was last updated.
            var updatedAt: GitHubGraphQL.DateTime { __data["updatedAt"] }
            /// The User owner of the repository.
            var owner: Owner { __data["owner"] }

            /// Search.Node.AsRepository.Languages
            ///
            /// Parent Type: `LanguageConnection`
            struct Languages: GitHubGraphQL.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.LanguageConnection }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("nodes", [Node?]?.self),
              ] }

              /// A list of nodes.
              var nodes: [Node?]? { __data["nodes"] }

              /// Search.Node.AsRepository.Languages.Node
              ///
              /// Parent Type: `Language`
              struct Node: GitHubGraphQL.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.Language }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("name", String.self),
                  .field("color", String?.self),
                ] }

                /// The name of the current language.
                var name: String { __data["name"] }
                /// The color defined for the current language.
                var color: String? { __data["color"] }
              }
            }

            /// Search.Node.AsRepository.Watchers
            ///
            /// Parent Type: `UserConnection`
            struct Watchers: GitHubGraphQL.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.UserConnection }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("totalCount", Int.self),
              ] }

              /// Identifies the total count of items in the connection.
              var totalCount: Int { __data["totalCount"] }
            }

            /// Search.Node.AsRepository.Owner
            ///
            /// Parent Type: `RepositoryOwner`
            struct Owner: GitHubGraphQL.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Interfaces.RepositoryOwner }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("avatarUrl", GitHubGraphQL.URI.self),
                .field("login", String.self),
              ] }

              /// A URL pointing to the owner's public avatar.
              var avatarUrl: GitHubGraphQL.URI { __data["avatarUrl"] }
              /// The username used to login.
              var login: String { __data["login"] }
            }
          }
        }

        /// Search.PageInfo
        ///
        /// Parent Type: `PageInfo`
        struct PageInfo: GitHubGraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GitHubGraphQL.Objects.PageInfo }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("startCursor", String?.self),
            .field("endCursor", String?.self),
            .field("hasNextPage", Bool.self),
            .field("hasPreviousPage", Bool.self),
          ] }

          /// When paginating backwards, the cursor to continue.
          var startCursor: String? { __data["startCursor"] }
          /// When paginating forwards, the cursor to continue.
          var endCursor: String? { __data["endCursor"] }
          /// When paginating forwards, are there more items?
          var hasNextPage: Bool { __data["hasNextPage"] }
          /// When paginating backwards, are there more items?
          var hasPreviousPage: Bool { __data["hasPreviousPage"] }
        }
      }
    }
  }

}