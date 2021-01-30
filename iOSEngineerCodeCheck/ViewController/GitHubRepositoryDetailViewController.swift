//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailViewController: UIViewController {
    /// BaseView
    private var baseView: GitHubRepositoryDetailBaseView { self.view as! GitHubRepositoryDetailBaseView } // swiftlint:disable:this force_cast
    /// GitHubのリポジトリ（前画面から値が渡されることが保証されているため、後のオプショナル バインディングを省略するために強制アンラップする）
    var gitHubRepository: GitHubRepository.Item!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegateDataSource()
        self.setNavigation()
        self.setUI()
    }
}
// MARK: - Private Method
extension GitHubRepositoryDetailViewController {
    // ナビゲーションの設定
    private func setNavigation() {
        self.navigationItem.title = "リポジトリ詳細"
    }
    private func setUI() {
        if let gitHubRepository = self.gitHubRepository {
            self.baseView.setUI(gitHubRepository: gitHubRepository)
        }
    }
    private func setDelegateDataSource() {
        self.baseView.delegate = self
    }
    private func transitionLicensePage() {
        guard let vc = R.storyboard.gitHubLicenseViewController.instantiateInitialViewController() else { return }
        vc.gitHubLicenseApiKey = self.gitHubRepository.license?.key
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - BaseView Delegate Method
extension GitHubRepositoryDetailViewController: GitHubRepositoryDetailBaseViewDelegate {
    func didTapHomePageButton() {
        if let homePageUrlString = self.gitHubRepository.homePage {
            self.transitionSafariViewController(urlString: homePageUrlString)
        }
    }
    func didTapStarButton() {
    }
    func didTapLicenseCell() {
        if gitHubRepository.license != nil {
            self.transitionLicensePage()
        }
    }
}
