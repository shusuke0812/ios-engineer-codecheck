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
    func getGitHubLicense(request: URLRequest, completion: @escaping (Result<GitHubLicense, Error>) -> Void)
}

class GitHubLicenseRepository: GitHubLicenseRepositoryProtocol {
}
// MARK: - API Method
extension GitHubLicenseRepository {
    internal func getGitHubLicense(request: URLRequest, completion: @escaping (Result<GitHubLicense, Error>) -> Void) {
        // リクエストを送信して、レスポンスを受け取る
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, _, error in
            // 通信完了時に実行： completionHandler
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
                let gitHubLicense = try decoder.decode(GitHubLicense.self, from: data)
                completion(.success(gitHubLicense))
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }
        // タスク実行
        task.resume()
    }
}
