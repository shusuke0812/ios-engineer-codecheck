//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import RxSwift

class GitHubRepositoryDetailViewController: UIViewController {
    private var baseView: GitHubRepositoryDetailBaseView { self.view as! GitHubRepositoryDetailBaseView } // swiftlint:disable:this force_cast
    private let disposeBag = RxSwift.DisposeBag()

    private(set) var gitHubRepository: GitHubRepository? // 前画面から値を受け取るようにしているが、SplitView対応に伴い画面立ち上げ時にnilとなるためオプショナル型で宣言

    static func instantiate(gitHubRepository: GitHubRepository) -> GitHubRepositoryDetailViewController {
        let vc = R.storyboard.gitHubRepositoryDetailViewController.instantiateInitialViewController()! // swiftlint:disable:this force_cast
        vc.gitHubRepository = gitHubRepository
        return vc
    }

    // MARK: Redux
    private var store: AppStore<AppState> {
        let delegate = UIApplication.shared.delegate as! AppDelegate // swiftlint:disable:this force_cast
        return delegate.store
    }

    private struct Props {
        let readme: GitHubReadme
        let fetchReadmeRepository: () -> Void
    }

    private func map(state: RepositoryReadmeState, request: GetRepositoryReadmeRequest) -> Props {
        Props(readme: state.readme) { [weak self] in
            self?.store.dispatch(action: FetchRepositoryReadme(request: request))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateDataSource()
        setNavigation()
        setUI()
        setObservers()

        getReadme()
    }
}

// MARK: - Initialized

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
    }
    private func setObservers() {
        store.nextState.subscribe(
            onNext: { [weak self] _state in
                DispatchQueue.main.async {
                    self?.baseView.setReadmeWebView(urlString: _state.repositoryReadmeState.readme.htmlUrl)
                }
            },
            onError: nil,
            onCompleted: nil
        )
        .disposed(by: disposeBag)
    }
}

// MARK: - Transition

extension GitHubRepositoryDetailViewController {
    private func transitionLicensePage(licenseKey: String) {
        let vc = GitHubLicenseViewController.instantiate(gitHubLicenseApiKey: licenseKey)
        navigationController?.pushViewController(vc, animated: true)
    }
    private func showLicensePage(licenseKey: String) {
        let vc = GitHubLicenseViewController.instantiate(gitHubLicenseApiKey: licenseKey)
        showDetailViewController(vc, sender: nil)
    }
}

// MARK: - FetchAction

extension GitHubRepositoryDetailViewController {
    private func getReadme() {
        guard let owner = gitHubRepository?.owner?.name, let repository = gitHubRepository?.name else { return }

        let request = GetRepositoryReadmeRequest(owner: owner, repository: repository)
        let props = map(state: store.state.repositoryReadmeState, request: request)
        props.fetchReadmeRepository()
    }
}

// MARK: - BaseViewDelegate

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
