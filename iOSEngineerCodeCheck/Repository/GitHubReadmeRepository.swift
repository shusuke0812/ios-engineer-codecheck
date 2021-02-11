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
    /// - Parameters:
    ///   - owner: リポジトリアカウント名
    ///   - repository: リポジトリ名
    ///   - completion: README取得の成功、失敗ハンドル
    func getRepositoryReadme(owner: String, repository: String, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void)
}
class GitHubReadmeRepository: GitHubReadmeRepositoryProtocol {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
}
// MARK: - API Method
extension GitHubReadmeRepository {
    func getRepositoryReadme(owner: String, repository: String, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void) {
        // リクエストの組み立て
        let gitHubAPIRequest = GetRepositoryReadmeRequest(owner: owner, repository: repository)
        // APIコール
        self.apiClient.sendRequest(gitHubAPIRequest) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
