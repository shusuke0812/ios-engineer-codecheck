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
    var parameters: [URLQueryItem]? { get }
    var header: [String: String]? { get }
    var body: Data? { get }
}
// MARK: - Custom Setting
extension GitHubAPIRequest {
    var baseURL: String {
        "https://api.github.com"
    }
    func buildURLRequest() -> URLRequest {
        // baseURL, pathは各apiクラスで正しく定義されているという前提で強制アンラップさせた
        let url = URL(string: baseURL.appending(path))! // swiftlint:disable:this force_unwrapping
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        switch method {
        case .get:
            components?.queryItems = parameters
        default:
            fatalError("Unsupported method \(method)")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
