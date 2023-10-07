//
//  GraphQLSearchRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation
import Apollo

struct GraphQLSearchRequest: GraphQLRequestProtocol {
    typealias Query = GitHubReposQuery
    
    var query: GitHubReposQuery
    var url: URL = "https://api.github.com/graphql".toURL()
    var httpAdditionalHeaders: [AnyHashable : Any]? = [
        "Authorization": "Bearer \(GitHubAccessToken.load())"
    ]
}
