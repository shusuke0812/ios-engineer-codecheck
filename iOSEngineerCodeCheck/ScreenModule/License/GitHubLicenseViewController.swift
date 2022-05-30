//
//  GitHubLicenseViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/28.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubLicenseViewController: UIViewController {
    private var baseView: GitHubLicenseBaseView { view as! GitHubLicenseBaseView } // swiftlint:disable:this force_cast
    private var viewModel: GitHubLicenseViewModel!

    var gitHubLicenseApiKey: String?

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
    private func setNavigation() {
        navigationItem.title = "ライセンス"
    }
    private func setDelegateDataSource() {
        viewModel.delegate = self
    }
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
