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
    /// ViewModel
    private var viewModel: GitHubRepositoryDetailViewModel!
    /// GitHubのリポジトリ（前画面から値を受け取るようにしているが、SplitView対応に伴い画面立ち上げ時にnilとなるためオプショナル型で宣言）
    private(set) var gitHubRepository: GitHubRepository?

    /// ViewControllerインスタンス生成
    static func instantiate(gitHubRepository: GitHubRepository) -> GitHubRepositoryDetailViewController {
        let vc = R.storyboard.gitHubRepositoryDetailViewController().instantiateInitialViewController() as! GitHubRepositoryDetailViewController // swiftlint:disable:this force_cast
        vc.gitHubRepository = gitHubRepository
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GitHubRepositoryDetailViewModel(gitHubReadmeRepository: GitHubReadmeRepository())
        self.setDelegateDataSource()
        self.setNavigation()
        self.setUI()
        self.loadGitHubReadme()
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
        self.viewModel.delegate = self
    }
    private func transitionLicensePage(licenseKey: String) {
        let vc = GitHubLicenseViewController.instantiate(gitHubLicenseApiKey: licenseKey)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func showLicensePage(licenseKey: String) {
        let vc = GitHubLicenseViewController.instantiate(gitHubLicenseApiKey: licenseKey)
        self.showDetailViewController(vc, sender: nil)
    }
    private func loadGitHubReadme() {
        // リクエストを組み立て
        guard let ownerName = self.gitHubRepository?.owner?.name, let repositoryName = self.gitHubRepository?.name else { return }
        // APIコール
        self.viewModel.getGitHubReadme(owner: ownerName, repository: repositoryName)
    }
}
// MARK: - BaseView Delegate Method
extension GitHubRepositoryDetailViewController: GitHubRepositoryDetailBaseViewDelegate {
    func didTapHomePageButton() {
        if let homePageUrlString = self.gitHubRepository?.homePage {
            self.transitionSafariViewController(urlString: homePageUrlString)
        }
    }
    func didTapStarButton() {
    }
    func didTapLicenseCell() {
        guard let licenseKey = self.gitHubRepository?.license?.key else { return }
        switch DeviceJudgeHelper.getType {
        case .phone: self.transitionLicensePage(licenseKey: licenseKey)
        case .pad: self.showLicensePage(licenseKey: licenseKey)
        default: return
        }
    }
}
// MARK: - ViewModel Delegate Method
extension GitHubRepositoryDetailViewController: GitHubRepositoryDetailViewModelDelegate {
    func didSuccessGetReadme() {
        if let urlString = self.viewModel.gitHubReadme?.htmlUrl {
            DispatchQueue.main.async {
                self.baseView.setReadmeWebView(urlString: urlString)
            }
        }
    }
    func didFailedGetReadme(errorMessage: String) {
        print(errorMessage)
    }
}
