//
//  GitHubRepositorySearchViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol GitHubRepositorySearchViewModelDelegate: AnyObject {
    func didSuccessGetGitHubRepositorys()
    func didFailedGetGitHubRepositorys(errorMessage: String)
}

class GitHubRepositorySearchViewModel: NSObject {
    private let gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol
    var gitHubRepositorys: [GitHubRepository] = []

    weak var delegate: GitHubRepositorySearchViewModelDelegate?

    let maxGitHubRepositorySearchCount = 20
    var gitHubRepositorySearchPageNumber: Int = 1
    var apiLoadStatus: APILoadingStatus = .initial
    var searchWord: String = ""

    init(gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol) {
        self.gitHubRepositorySearchRepository = gitHubRepositorySearchRepository
    }
}

// MARK: - API Method

extension GitHubRepositorySearchViewModel {
    func getGitHubRepositorys() {
        if apiLoadStatus == .fetching || apiLoadStatus == .full {
            return
        } else {
            apiLoadStatus = .fetching
        }
        gitHubRepositorySearchRepository.getGitHubRepositorys(searchWord: searchWord, searchCount: maxGitHubRepositorySearchCount, page: gitHubRepositorySearchPageNumber) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let response):
                if response.items.count < self.maxGitHubRepositorySearchCount {
                    self.apiLoadStatus = .full
                } else {
                    self.apiLoadStatus = .initial
                }
                self.gitHubRepositorySearchPageNumber += 1
                self.gitHubRepositorys.append(contentsOf: response.items)
                self.delegate?.didSuccessGetGitHubRepositorys()
            case .failure(let error):
                self.delegate?.didFailedGetGitHubRepositorys(errorMessage: error.description())
            }
        }
    }
    @available(iOS 15.0, *)
    func async_getGitHubRepositorys() {
        if apiLoadStatus == .fetching || apiLoadStatus == .full {
            return
        } else {
            self.apiLoadStatus = .fetching
        }
        gitHubRepositorySearchRepository.async_getGitHubRepositorys(searchWord: searchWord, serchCount: maxGitHubRepositorySearchCount, page: gitHubRepositorySearchPageNumber) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let response):
                if response.items.count < self.maxGitHubRepositorySearchCount {
                    self.apiLoadStatus = .full
                } else {
                    self.apiLoadStatus = .initial
                }
                self.gitHubRepositorySearchPageNumber += 1
                self.gitHubRepositorys.append(contentsOf: response.items)
                self.delegate?.didSuccessGetGitHubRepositorys()
            case .failure(let error):
                self.delegate?.didFailedGetGitHubRepositorys(errorMessage: error.localizedDescription)
            }
        }
    }
    func initAPIParameters() {
        gitHubRepositorySearchPageNumber = 1
        apiLoadStatus = .initial
        gitHubRepositorys = []
    }
}

// MARK: - UITableView DataSource Method

extension GitHubRepositorySearchViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gitHubRepositorys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.gitHubRepositoryCell, for: indexPath)! // swiftlint:disable:this force_unwrapping
        if !gitHubRepositorys.isEmpty {
            cell.setUI(gitHubRepository: gitHubRepositorys[indexPath.row])
        }
        return cell
    }
}
