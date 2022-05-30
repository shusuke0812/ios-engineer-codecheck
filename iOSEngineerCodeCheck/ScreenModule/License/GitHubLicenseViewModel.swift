//
//  GitHubLicenseViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/28.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubLicenseViewModelDelegate: AnyObject {
    /// GitHubのライセンスの取得に成功した
    func didSuccessGetLicense()
    /// GitHubのライセンスの取得に失敗した
    func didFailedGetLicense(errorMessage: String)
}

class GitHubLicenseViewModel {
    /// GitHubライセンスのリポジトリクラス
    private let gitHubLicenseRepository: GitHubLicenseRepositoryProtocol
    /// GitHubリポジトリのライセンス
    var gitHubLicense: GitHubLicense?
    /// GitHubLicenseViewModelのデリゲート
    weak var delegate: GitHubLicenseViewModelDelegate?

    init(gitHubLicenseRepository: GitHubLicenseRepositoryProtocol) {
        self.gitHubLicenseRepository = gitHubLicenseRepository
    }
}
// MARK: - API Method
extension GitHubLicenseViewModel {
    /// GitHubリポジトリを取得する
    /// - Parameter request: APIリクエスト
    func getGitHubLicense(licenseApiKey: String) {
        gitHubLicenseRepository.getGitHubLicense(licenseApiKey: licenseApiKey) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let gitHubLicense):
                self.gitHubLicense = gitHubLicense
                self.delegate?.didSuccessGetLicense()
            case .failure(let error):
                print("DEBUG: ", error)
                self.delegate?.didFailedGetLicense(errorMessage: error.description())
            }
        }
    }
}
