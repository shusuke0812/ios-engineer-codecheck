//
//  GraphQLSearchRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation
import GitHubGraphQL

struct GraphQLSearchRequest: GraphQLRequestProtocol {
    typealias Query = GitHubReposQuery

    var query: GitHubReposQuery
    var url = URL(string: "https://api.github.com/graphql")! // swiftlint:disable:this force_unwrapping
    var httpAdditionalHeaders: [AnyHashable: Any]? = [
        "Authorization": "Bearer \(JsonFileReadHelper.getGitHubAccessToken())"
    ]
}
