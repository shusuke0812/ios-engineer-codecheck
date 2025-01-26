//
//  GitHubRepositoryDetailRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/6.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubReadmeRepositoryProtocol {
    func getRepositoryReadme(request: GetRepositoryReadmeRequest, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void)
}
class GitHubReadmeRepository: GitHubReadmeRepositoryProtocol {
}
// MARK: - API Method
extension GitHubReadmeRepository {
    func getRepositoryReadme(request: GetRepositoryReadmeRequest, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void) {
        APIClient.shared.sendRequest(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
