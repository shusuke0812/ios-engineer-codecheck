//
//  GetRepositoryReadme.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/2.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

// GitHubAPI ドキュメント（Get a repository README） : https://docs.github.com/ja/rest/reference/repos#get-a-repository-readme

import Foundation

struct GetRepositoryReadmeRequest: APIRequestProtocol {
    let owner: String
    let repository: String

    typealias Response = GitHubReadme
    typealias ErrorResponse = GitHubAPIError

    var baseURL: String {
        "https://api.github.com"
    }

    var method: HTTPMethod {
        .get
    }
    var path: String {
        "/repos/\(owner)/\(repository)/readme"
    }
    var parameters: [URLQueryItem]? {
        nil
    }
    var header: [String: String]? {
        nil
    }
    var body: Data? {
        nil
    }
}
