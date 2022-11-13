//
//  GitHubLicenseViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/28.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit
import RxSwift

class GitHubLicenseViewController: UIViewController {
    private var baseView: GitHubLicenseBaseView { self.view as! GitHubLicenseBaseView } // swiftlint:disable:this force_cast
    private let disposeBag = RxSwift.DisposeBag()

    private var gitHubLicenseApiKey: String?

    static func instantiate(gitHubLicenseApiKey: String) -> GitHubLicenseViewController {
        let vc = R.storyboard.gitHubLicenseViewController().instantiateInitialViewController() as! GitHubLicenseViewController // swiftlint:disable:this force_cast
        vc.gitHubLicenseApiKey = gitHubLicenseApiKey
        return vc
    }

    // MARK: Redux
    private var store: AppStore<AppState> {
        let delegate = UIApplication.shared.delegate as! AppDelegate // swiftlint:disable:this force_cast
        return delegate.store
    }

    private struct Props {
        let license: GitHubLicense
        let fetchRepositoryLicense: () -> Void
    }

    private func map(state: RepositoryLicenseState, request: LicenseRequest) -> Props {
        Props(license: state.license) { [weak self] in
            self?.store.dispatch(action: FetchRepositoryLicense(request: request))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setObserver()

        getLicense()
    }
}

// MARK: - Initialized

extension GitHubLicenseViewController {
    private func setNavigation() {
        self.navigationItem.title = "ライセンス"
    }
    private func setObserver() {
        store.nextState.subscribe(
            onNext: { [weak self] _state in
                DispatchQueue.main.async {
                    self?.baseView.setUI(gitHubLicenseText: _state.repositoryLicenseState.license.body)
                }
            },
            onError: nil,
            onCompleted: nil
        )
        .disposed(by: disposeBag)
    }
}

// MARK: - FetchAction

extension GitHubLicenseViewController {
    private func getLicense() {
        guard let licenseApikey = self.gitHubLicenseApiKey else { return }

        let request = LicenseRequest(key: licenseApikey)
        let props = map(state: store.state.repositoryLicenseState, request: request)
        props.fetchRepositoryLicense()
    }
}
