//
//  LicenseRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/27.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

struct LicenseRequest: GitHubAPIRequest {
    /// ライセンスキー
    let key: String

    // GitHubAPIRequestが要求する連装型
    typealias Response = GitHubLicense

    var method: HTTPMethod {
        .get
    }
    var path: String {
        "/licenses/\(self.key)"
    }
    var parameters: [URLQueryItem]? {
        nil
    }
    var body: Encodable? {
        nil
    }
}
