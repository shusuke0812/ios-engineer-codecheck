//
//  SearchRepositories.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/23.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

class GitHubAPI {
    struct SearchRepositories: GitHubAPIRequest {
        /// 検索ワード
        let searchWord: String
        /// 検索結果の最大取得数
        let searchCount: Int

        // GitHubAPIRequestが要求する連想型
        typealias Response = GitHubRepository

        var method: HTTPMethod {
            .get
        }
        var path: String {
            "/search/repositories"
        }
        var parameters: [URLQueryItem] {
            [
                URLQueryItem(name: "q", value: self.searchWord),
                URLQueryItem(name: "per_page", value: "\(self.searchCount)")
            ]
        }
        var body: Encodable? {
            nil
        }
    }
}
