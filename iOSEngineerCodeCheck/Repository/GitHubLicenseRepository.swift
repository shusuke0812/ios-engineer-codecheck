//
//  GitHubLicenseRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/28.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubLicenseRepositoryProtocol {
    /// GiHubリポジトリのライセンス情報を取得する
    /// - Parameters:
    ///   - request: APIのリクエスト
    ///   - completion: ライセンス取得の成功、失敗ハンドル
    func getGitHubLicense(request: URLRequest, completion: @escaping (Result<GitHubLicense, APIClientError>) -> Void)
}

class GitHubLicenseRepository: GitHubLicenseRepositoryProtocol {
}
// MARK: - API Method
extension GitHubLicenseRepository {
    internal func getGitHubLicense(request: URLRequest, completion: @escaping (Result<GitHubLicense, APIClientError>) -> Void) {
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
            if (200..<300).contains(response.statusCode) {
                do {
                    let gitHubLicense = try decoder.decode(GitHubLicense.self, from: data)
                    completion(.success(gitHubLicense))
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
