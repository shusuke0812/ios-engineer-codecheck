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
    /// 検索ワード
    let searchWord: String
    /// 検索結果の最大取得数
    let searchCount: Int
    /// ページ番号
    let page: Int

    // GitHubAPIRequestが要求する連想型
    typealias Response = Items<GitHubRepository>

    var method: HTTPMethod {
        .get
    }
    var path: String {
        "/search/repositories"
    }
    var parameters: [URLQueryItem]? {
        [
            URLQueryItem(name: "q", value: searchWord),
            URLQueryItem(name: "per_page", value: "\(searchCount)"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
    var header: [String: String]? {
        nil
    }
    var body: Data? {
        nil
    }
}
