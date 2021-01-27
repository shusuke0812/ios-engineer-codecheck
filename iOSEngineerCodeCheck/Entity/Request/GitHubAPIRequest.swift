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
    /// APIプレフィックス
    var baseURL: String {
        "https://api.github.com"
    }
    /// APIコール用のリクエスト生成
    func buildURLRequest() -> URLRequest {
        // baseURL, pathは各apiクラスで正しく定義されているという前提で強制アンラップさせた
        let url = URL(string: self.baseURL.appending(self.path))! // swiftlint:disable:this force_unwrapping
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        switch self.method {
        case .get:
            components?.queryItems = self.parameters
        default:
            fatalError("Unsupported method \(self.method)")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = self.method.rawValue

        return urlRequest
    }
}
