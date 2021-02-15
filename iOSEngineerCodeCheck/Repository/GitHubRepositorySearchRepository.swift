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
    /// - Parameters:
    ///   - searchWord: 検索ワード
    ///   - searchCount: 検索出力数
    ///   - page: ページ番号
    ///   - completion: リポジトリ取得の成功、失敗ハンドル
    func getGitHubRepositorys(searchWord: String, searchCount: Int, page: Int, completion: @escaping (Result<GitHubRepository, APIClientError>) -> Void)
}
class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    internal func getGitHubRepositorys(searchWord: String, searchCount: Int, page: Int, completion: @escaping (Result<GitHubRepository, APIClientError>) -> Void) {
        // リクエストの組み立て
        let gitHubAPIRequest = SearchRepositoriesRequest(searchWord: searchWord, searchCount: searchCount, page: page)
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
