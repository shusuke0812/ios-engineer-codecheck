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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GitHubLicenseViewModel(gitHubLicenseRepository: GitHubLicenseRepository())
    }
}
// MARK: - Private Method
extension GitHubLicenseViewController {
    // DelegateとDataSourceの登録
    private func setDelegateDataSource() {
        self.viewModel.delegate = self
    }
}
// MARK: - ViewModel Delegate Method
extension GitHubLicenseViewController: GitHubLicenseViewModelDelegate {
    func didSuccessGetLicense() {
    }
    func didFailedGetLicense(errorMessage: String) {
        print(errorMessage)
    }
}
