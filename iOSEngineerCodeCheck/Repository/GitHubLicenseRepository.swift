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
    ///   - licenseApiKey: LICENSEのキー
    ///   - completion: ライセンス取得の成功、失敗ハンドル
    func getGitHubLicense(licenseApiKey: String, completion: @escaping (Result<GitHubLicense, APIClientError>) -> Void)
}
class GitHubLicenseRepository: GitHubLicenseRepositoryProtocol {
}
// MARK: - API Method
extension GitHubLicenseRepository {
    func getGitHubLicense(licenseApiKey: String, completion: @escaping (Result<GitHubLicense, APIClientError>) -> Void) {
        // リクエストの組み立て
        let gitHubAPIRequest = LicenseRequest(key: licenseApiKey)
        // APIコール
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
