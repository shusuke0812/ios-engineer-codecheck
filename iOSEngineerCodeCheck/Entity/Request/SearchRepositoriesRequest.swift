//
//  SearchRepositories.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/23.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

// GitHubAPI ドキュメント（Search Repositories）： https://docs.github.com/ja/rest/reference/search#search-repositories

import Foundation

struct SearchRepositoriesRequest: GitHubAPIRequest {
    let searchWord: String
    let searchCount: Int
    let page: Int

    typealias Response = Items<GitHubRepository>

    var method: HTTPMethod {
        .get
    }
    var path: String {
        "/search/repositories"
    }
    var parameters: [URLQueryItem]? {
        [
            URLQueryItem(name: "q", value: self.searchWord),
            URLQueryItem(name: "per_page", value: "\(self.searchCount)"),
            URLQueryItem(name: "page", value: "\(self.page)")
        ]
    }
    var header: [String: String]? {
        nil
    }
    var body: Data? {
        nil
    }
}
