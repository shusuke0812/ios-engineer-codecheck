//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailViewController: UIViewController {
    private var baseView: GitHubRepositoryDetailBaseView { view as! GitHubRepositoryDetailBaseView } // swiftlint:disable:this force_cast
    private var viewModel: GitHubRepositoryDetailViewModel!
    /// GitHubのリポジトリ（前画面から値を受け取るようにしているが、SplitView対応に伴い画面立ち上げ時にnilとなるためオプショナル型で宣言）
    private(set) var gitHubRepository: GitHubRepository?

    static func instantiate(gitHubRepository: GitHubRepository) -> GitHubRepositoryDetailViewController {
        let vc = R.storyboard.gitHubRepositoryDetailViewController().instantiateInitialViewController() as! GitHubRepositoryDetailViewController // swiftlint:disable:this force_cast
        vc.gitHubRepository = gitHubRepository
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GitHubRepositoryDetailViewModel(gitHubReadmeRepository: GitHubReadmeRepository())
        setDelegateDataSource()
        setNavigation()
        setUI()
        loadGitHubReadme()
    }
}

// MARK: - Private Method

extension GitHubRepositoryDetailViewController {
    private func setNavigation() {
        navigationItem.title = "リポジトリ詳細"
    }
    private func setUI() {
        if let gitHubRepository = gitHubRepository {
            baseView.setUI(gitHubRepository: gitHubRepository)
        }
    }
    private func setDelegateDataSource() {
        baseView.delegate = self
        viewModel.delegate = self
    }
    private func transitionLicensePage(licenseKey: String) {
        let vc = GitHubLicenseViewController.instantiate(gitHubLicenseApiKey: licenseKey)
        navigationController?.pushViewController(vc, animated: true)
    }
    private func showLicensePage(licenseKey: String) {
        let vc = GitHubLicenseViewController.instantiate(gitHubLicenseApiKey: licenseKey)
        showDetailViewController(vc, sender: nil)
    }
    private func loadGitHubReadme() {
        guard let ownerName = gitHubRepository?.owner?.name, let repositoryName = gitHubRepository?.name else { return }
        viewModel.getGitHubReadme(owner: ownerName, repository: repositoryName)
    }
}

// MARK: - BaseView Delegate Method

extension GitHubRepositoryDetailViewController: GitHubRepositoryDetailBaseViewDelegate {
    func didTapHomePageButton() {
        if let homePageUrlString = gitHubRepository?.homePage {
            transitionSafariViewController(urlString: homePageUrlString)
        }
    }
    func didTapStarButton() {
    }
    func didTapLicenseCell() {
        guard let licenseKey = gitHubRepository?.license?.key else { return }
        switch DeviceJudgeHelper.getType {
        case .phone: transitionLicensePage(licenseKey: licenseKey)
        case .pad: showLicensePage(licenseKey: licenseKey)
        default: return
        }
    }
}

// MARK: - ViewModel Delegate Method

extension GitHubRepositoryDetailViewController: GitHubRepositoryDetailViewModelDelegate {
    func didSuccessGetReadme() {
        if let urlString = viewModel.gitHubReadme?.htmlUrl {
            DispatchQueue.main.async {
                self.baseView.setReadmeWebView(urlString: urlString)
            }
        }
    }
    func didFailedGetReadme(errorMessage: String) {
        print(errorMessage)
    }
}
