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
    func getRepositoryReadme(request: URLRequest, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void)
}
class GitHubReadmeRepository: GitHubReadmeRepositoryProtocol {
}
// MARK: - API Method
extension GitHubReadmeRepository {
    func getRepositoryReadme(request: URLRequest, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.connectionError(error)))
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            print("DEBUG: status=\(response.statusCode)", response)
            let decoder = JSONDecoder()
            if (200..<300).contains(response.statusCode) {
                do {
                    let gitHubReadme = try decoder.decode(GitHubReadme.self, from: data)
                    completion(.success(gitHubReadme))
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
        task.resume()
    }
}
