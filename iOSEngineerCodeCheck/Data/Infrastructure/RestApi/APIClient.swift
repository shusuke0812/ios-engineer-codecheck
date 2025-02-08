//
//  APIClient.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/11.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//
import Foundation

protocol APIClientProtocol {
    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, APIClientError>) -> Void)
    func sendRequest<T: GitHubAPIRequest>(_ request: T) async throws -> T.Response
}
class APIClient: APIClientProtocol {
    private let decoder: JSONDecoder

    init() {
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
    }

    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, APIClientError>) -> Void) {
        let networkConnection = NetworkConnection(request: request.buildURLRequest())
        networkConnection
            .retry(3)
            .error { error, _ in
                guard let error = error as? APIClientError else {
                    completion(.failure(.unknown))
                    return
                }
                completion(.failure(error))
            }
            .completion { data, _ in
                guard let data = data else {
                    // TODO: noBodyを成功通知として返す
                    return
                }
                do {
                    let res = try self.decoder.decode(T.Response.self, from: data)
                    completion(.success(res))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            }
            .resume()
    }

    func sendRequest<T: GitHubAPIRequest>(_ request: T) async throws -> T.Response {
        let session = URLSession.shared
        do {
            let (data, response) = try await session.data(for: request.buildURLRequest(), delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw APIClientError.unknown
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if (200..<300).contains(response.statusCode) {
                do {
                    let apiResponse = try decoder.decode(T.Response.self, from: data)
                    return apiResponse
                } catch {
                    throw APIClientError.responseParseError(error)
                }
            } else {
                do {
                    let apiError = try decoder.decode(T.ErrorResponse.self, from: data)
                    throw apiError
                } catch {
                    throw APIClientError.responseParseError(error)
                }
            }
        } catch {
            throw APIClientError.unknown
        }
    }
}
