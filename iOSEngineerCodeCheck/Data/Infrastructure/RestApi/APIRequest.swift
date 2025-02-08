//
//  APIRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/2/8.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol APIRequestProtocol {
    associatedtype Response: Decodable
    associatedtype ErrorResponse: Decodable, Error

    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [URLQueryItem]? { get }
    var header: [String: String]? { get }
    var body: Data? { get }
}

extension APIRequestProtocol {
    func buildURLRequest() -> URLRequest {
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
