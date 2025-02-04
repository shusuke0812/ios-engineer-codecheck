//
//  RetryAPIClient.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/2/4.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation

class RetryAPIClient {
    private let basedAPIClient: APIClient
    private let maxRetryCount: Int
    
    init(maxRetryCount: Int) {
        self.basedAPIClient = APIClient()
        self.maxRetryCount = maxRetryCount
    }
    
    func sendRequest<T: GitHubAPIRequest>(_ request: T, completion: @escaping (Result<T.Response, APIClientError>) -> Void) {
        sendRequestWithRetry(request, retryCount: maxRetryCount, completion: completion)
    }
    
    private func sendRequestWithRetry<T: GitHubAPIRequest>(_ request: T, retryCount: Int, completion: @escaping (Result<T.Response, APIClientError>) -> Void) {
        basedAPIClient.sendRequest(request) { [weak self] result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                if retryCount > 0 {
                    self?.sendRequestWithRetry(request, retryCount: retryCount - 1, completion: completion)
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}
