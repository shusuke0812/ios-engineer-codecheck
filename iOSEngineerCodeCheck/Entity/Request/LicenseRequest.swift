//
//  LicenseRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/27.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

struct LicenseRequest: GitHubAPIRequest {
    let key: String

    typealias Response = GitHubLicense
    typealias ErrorResponse = GitHubAPIError

    var method: HTTPMethod {
        .get
    }
    var path: String {
        "/licenses/\(key)"
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
