//
//  GraphQLSearchRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation
import Apollo
import GitHubGrapQL

struct GraphQLSearchRequest: GraphQLRequestProtocol {
    typealias Query = GitHubReposQuery
    
    var query: GitHubReposQuery
    var url: URL = URL(string: "https://api.github.com/graphql")!
    var httpAdditionalHeaders: [AnyHashable : Any]? = [
        "Authorization": "Bearer \(JsonFileReadHelper.getGitHubAccessToken())"
    ]
}
