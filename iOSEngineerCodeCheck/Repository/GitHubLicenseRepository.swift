//
//  GitHubLicenseRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/28.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubLicenseRepositoryProtocol {
    func getGitHubLicense(request: LicenseRequest, completion: @escaping (Result<GitHubLicense, APIClientError>) -> Void)
}

class GitHubLicenseRepository: GitHubLicenseRepositoryProtocol {
}

// MARK: - API Method

extension GitHubLicenseRepository {
    func getGitHubLicense(request: LicenseRequest, completion: @escaping (Result<GitHubLicense, APIClientError>) -> Void) {
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
