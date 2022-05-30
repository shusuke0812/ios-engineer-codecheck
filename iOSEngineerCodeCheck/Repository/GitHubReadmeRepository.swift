//
//  GitHubRepositoryDetailRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/6.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubReadmeRepositoryProtocol {
    func getRepositoryReadme(owner: String, repository: String, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void)
}
class GitHubReadmeRepository: GitHubReadmeRepositoryProtocol {
}
// MARK: - API Method
extension GitHubReadmeRepository {
    func getRepositoryReadme(owner: String, repository: String, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void) {
        let gitHubAPIRequest = GetRepositoryReadmeRequest(owner: owner, repository: repository)
        APIClient.shared.sendRequest(gitHubAPIRequest) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
