//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Foundation
import GitHubGrapQL

protocol GitHubRepositorySearchRepositoryProtocol {
    func getGitHubRepositories(request: SearchRepositoriesRequest, completion: @escaping (Result<Items<GitHubRepository>, APIClientError>) -> Void)
    func getGitHubRepositories(request: GraphQLSearchRequest, completion: @escaping (Result<GitHubReposQuery.Data?, Error>) -> Void)
    @available(iOS 15.0, *)
    func async_getGitHubRepositorys(searchWord: String, serchCount: Int, page: Int, completion: @escaping (Result<Items<GitHubRepository>, Error>) -> Void)
}
class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    func getGitHubRepositories(request: SearchRepositoriesRequest, completion: @escaping (Result<Items<GitHubRepository>, APIClientError>) -> Void) {
        APIClient.shared.sendRequest(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func getGitHubRepositories(request: GraphQLSearchRequest, completion: @escaping (Result<GitHubReposQuery.Data?, Error>)  -> Void) {
        GraphQLClient.shared.sendRequest(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response.data))
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
