//
//  GitHubAPIRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/23.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubAPIRequest {
    associatedtype Response: Decodable

    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [URLQueryItem] { get }
    var body: Encodable? { get }
}
// MARK: - Custom Setting
extension GitHubAPIRequest {
    var baseURL: String {
        "https://api.github.com"
    }
}
