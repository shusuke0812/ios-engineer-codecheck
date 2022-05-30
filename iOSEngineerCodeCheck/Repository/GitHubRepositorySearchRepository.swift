//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubRepositorySearchRepositoryProtocol {
    func getGitHubRepositorys(searchWord: String, searchCount: Int, page: Int, completion: @escaping (Result<Items<GitHubRepository>, APIClientError>) -> Void)
    @available(iOS 15.0, *)
    func async_getGitHubRepositorys(searchWord: String, serchCount: Int, page: Int, completion: @escaping (Result<Items<GitHubRepository>, Error>) -> Void)
}
class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    func getGitHubRepositorys(searchWord: String, searchCount: Int, page: Int, completion: @escaping (Result<Items<GitHubRepository>, APIClientError>) -> Void) {
        let gitHubAPIRequest = SearchRepositoriesRequest(searchWord: searchWord, searchCount: searchCount, page: page)
        APIClient.shared.sendRequest(gitHubAPIRequest) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    @available(iOS 15.0, *)
    func async_getGitHubRepositorys(searchWord: String, serchCount: Int, page: Int, completion: @escaping (Result<Items<GitHubRepository>, Error>) -> Void) {
        Task.detached {
            do {
                let gitHubAPIRequest = SearchRepositoriesRequest(searchWord: searchWord, searchCount: serchCount, page: page)
                let response = try await APIClient.shared.sendRequest(gitHubAPIRequest)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        
    }
}
