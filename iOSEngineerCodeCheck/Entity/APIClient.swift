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
    @available(iOS 15.0, *)
    func sendRequest<T: GitHubAPIRequest>(_ request: T) async throws -> T.Response
}
class APIClient: APIClientProtocol {
    static let shared = APIClient()
    private init() {}
}
// MARK: - API Base Method
extension APIClient {
    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, APIClientError>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request.buildURLRequest()) { data, response, error in
            if let error = error {
                completion(.failure(.connectionError(error)))
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            print("DEBUG: status=\(response.statusCode)\n", response)
            print("DEBUG: data=\(String(data: data, encoding: .utf8))")
            let decoder = JSONDecoder()
            // TODO: dateのフォーマット型はレスポンスによるのでデコーダー処理を別に定義した方が良さそう（ex. APIRequest型に実装する）
            decoder.dateDecodingStrategy = .iso8601
            if (200..<300).contains(response.statusCode) {
                do {
                    let apiResponse = try decoder.decode(T.Response.self, from: data)
                    completion(.success(apiResponse))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            } else {
                do {
                    // TODO: 他のAPIError型でも使えるように汎用化する
                    let apiError = try decoder.decode(GitHubAPIError.self, from: data)
                    completion(.failure(.apiError(apiError)))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            }
        }
        task.resume()
    }

    @available(iOS 15.0, *)
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
