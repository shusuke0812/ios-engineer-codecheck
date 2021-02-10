//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubRepositorySearchRepositoryProtocol {
    /// GitHubRepositoryを取得する
    /// - Parameter request: APIのリクエスト
    func getGitHubRepositorys(request: URLRequest, completion: @escaping (Result<[GitHubRepository.Item], APIClientError>) -> Void)
}
class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    internal func getGitHubRepositorys(request: URLRequest, completion: @escaping (Result<[GitHubRepository.Item], APIClientError>) -> Void) {
        // リクエストを送信して、レスポンスを受け取る
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.connectionError(error)))
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            print("DEBUG: status=\(response.statusCode)\n", response)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if (200..<300).contains(response.statusCode) {
                do {
                    let gitHubRepository = try decoder.decode(GitHubRepository.self, from: data)
                    completion(.success(gitHubRepository.items))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            } else {
                do {
                    let apiError = try decoder.decode(GitHubAPIError.self, from: data)
                    completion(.failure(.apiError(apiError)))
                } catch {
                    completion(.failure(.responseParseError(error)))
                }
            }
        }
        // タスク実行
        task.resume()
    }
}
