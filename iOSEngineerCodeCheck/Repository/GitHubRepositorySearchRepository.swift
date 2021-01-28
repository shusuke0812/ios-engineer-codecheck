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
    func getGitHubRepositorys(request: URLRequest, completion: @escaping (Result<[GitHubRepository.Item], Error>) -> Void)
}
class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    // GitHubRepositoryを取得する
    internal func getGitHubRepositorys(request: URLRequest, completion: @escaping (Result<[GitHubRepository.Item], Error>) -> Void) {
        // リクエストを送信して、レスポンスを受け取る
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, _, error in
            // 通信完了時に実行: completionHandler
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.unknown))
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let gitHubRepository = try decoder.decode(GitHubRepository.self, from: data)
                completion(.success(gitHubRepository.items))
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }
        // タスク実行
        task.resume()
    }
}
