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
    private var baseView: GitHubLicenseBaseView { view as! GitHubLicenseBaseView } // swiftlint:disable:this force_cast
    /// ViewModel
    private var viewModel: GitHubLicenseViewModel!
    /// ライセンスAPIのキー
    var gitHubLicenseApiKey: String?

    /// ViewControllerインスタンス生成
    static func instantiate(gitHubLicenseApiKey: String) -> GitHubLicenseViewController {
        let vc = R.storyboard.gitHubLicenseViewController().instantiateInitialViewController() as! GitHubLicenseViewController // swiftlint:disable:this force_cast
        vc.gitHubLicenseApiKey = gitHubLicenseApiKey
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GitHubLicenseViewModel(gitHubLicenseRepository: GitHubLicenseRepository())
        setDelegateDataSource()
        getLicense()
        setNavigation()
    }
}
// MARK: - Private Method
extension GitHubLicenseViewController {
    // ナビゲーションの設定
    private func setNavigation() {
        navigationItem.title = "ライセンス"
    }
    // DelegateとDataSourceの登録
    private func setDelegateDataSource() {
        viewModel.delegate = self
    }
    // ライセンス取得
    private func getLicense() {
        if let licenseApikey = gitHubLicenseApiKey {
            viewModel.getGitHubLicense(licenseApiKey: licenseApikey)
        }
    }
}
// MARK: - ViewModel Delegate Method
extension GitHubLicenseViewController: GitHubLicenseViewModelDelegate {
    func didSuccessGetLicense() {
        guard let gitHubLicenseText = viewModel.gitHubLicense?.body else { return }
        DispatchQueue.main.async {
            self.baseView.setUI(gitHubLicenseText: gitHubLicenseText)
        }
    }
    func didFailedGetLicense(errorMessage: String) {
        print(errorMessage)
    }
}
