//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol GitHubRepositorySearchRepositoryProtocol {
    /// GET：GitHubRepositoryを取得する
    /// - Parameter urlString: APIのURL
    func getGitHubRepositorys(urlString: String, completion: @escaping (Result<[GitHubRepository.Item], Error>) -> Void)
}
class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    // GitHubRepositoryを取得する
    internal func getGitHubRepositorys(urlString: String, completion: @escaping (Result<[GitHubRepository.Item], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        // レスポンスを受け取る
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.unknown))
                return
            }
            let decoder = JSONDecoder()
            do {
                let gitHubRepository = try decoder.decode(GitHubRepository.self, from: data)
                completion(.success(gitHubRepository.items))
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }
        task.resume()
    }
}
