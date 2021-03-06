//
//  GitHubLicenseViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/28.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubLicenseViewController: UIViewController {
    /// BaseView
    private var baseView: GitHubLicenseBaseView { self.view as! GitHubLicenseBaseView } // swiftlint:disable:this force_cast
    /// ViewModel
    private var viewModel: GitHubLicenseViewModel!
    /// ライセンスAPIのキー
    var gitHubLicenseApiKey: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GitHubLicenseViewModel(gitHubLicenseRepository: GitHubLicenseRepository())
        self.setDelegateDataSource()
        self.getLicense()
        self.setNavigation()
    }
}
// MARK: - Private Method
extension GitHubLicenseViewController {
    // ナビゲーションの設定
    private func setNavigation() {
        self.navigationItem.title = "ライセンス"
    }
    // DelegateとDataSourceの登録
    private func setDelegateDataSource() {
        self.viewModel.delegate = self
    }
    // ライセンス取得
    private func getLicense() {
        if let licenseApikey = self.gitHubLicenseApiKey {
            self.viewModel.getGitHubLicense(licenseApiKey: licenseApikey)
        }
    }
}
// MARK: - ViewModel Delegate Method
extension GitHubLicenseViewController: GitHubLicenseViewModelDelegate {
    func didSuccessGetLicense() {
        guard let gitHubLicenseText = self.viewModel.gitHubLicense?.body else { return }
        DispatchQueue.main.async {
            self.baseView.setUI(gitHubLicenseText: gitHubLicenseText)
        }
    }
    func didFailedGetLicense(errorMessage: String) {
        print(errorMessage)
    }
}
