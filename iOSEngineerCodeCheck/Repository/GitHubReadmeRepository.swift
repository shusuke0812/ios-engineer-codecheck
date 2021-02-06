//
//  GitHubRepositoryDetailRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/6.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubReadmeRepositoryProtocol {
    /// リポジトリのREADMEを取得する
    func getRepositoryReadme(request: URLRequest, completion: @escaping (Result<GitHubReadme, Error>) -> Void)
}
class GitHubReadmeRepository: GitHubReadmeRepositoryProtocol {
}
// MARK: - API Method
extension GitHubReadmeRepository {
    func getRepositoryReadme(request: URLRequest, completion: @escaping (Result<GitHubReadme, Error>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                completion(.failure(NetworkError.unknown))
                return
            }
            let decoder = JSONDecoder()
            do {
                let gitHubReadme = try decoder.decode(GitHubReadme.self, from: data)
                completion(.success(gitHubReadme))
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }
        task.resume()
    }
}
