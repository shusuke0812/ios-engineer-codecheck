//
//  GetRepositoryReadme.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/2.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

// GitHubAPI ドキュメント（Get a repository README） : https://docs.github.com/ja/rest/reference/repos#get-a-repository-readme

import Foundation

struct GetRepositoryReadmeRequest: GitHubAPIRequest {
    /// ユーザー名
    let owner: String
    /// リポジトリ名
    let repository: String
    
    // GitHubAPIRequestが要求する連想型
    typealias Response = GitHubReadme
    
    var method: HTTPMethod {
        .get
    }
    var path: String {
        "/repos/\(self.owner)/\(self.repository)/readme"
    }
    var parameters: [URLQueryItem]? {
        nil
    }
    var body: Encodable? {
        nil
    }
}
