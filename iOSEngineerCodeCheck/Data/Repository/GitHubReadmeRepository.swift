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
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getRepositoryReadme(request: GetRepositoryReadmeRequest, completion: @escaping (Result<GitHubReadme, APIClientError>) -> Void) {
        apiClient.sendRequest(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
