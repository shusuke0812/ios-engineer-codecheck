//
//  GitHubRepositorySearchViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol GitHubRepositorySearchViewModelDelegate: AnyObject {
    /// GitHubRepositoryの取得に成功した
    func didSuccessGetGitHubRepositorys()
    /// GitHubRepositoryの取得に失敗した
    /// - Parameter errorMessage: エラーメッセージ
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
        if self.apiLoadStatus == .fetching || self.apiLoadStatus == .full {
            return
        } else {
            self.apiLoadStatus = .fetching
        }
        self.gitHubRepositorySearchRepository.getGitHubRepositorys(searchWord: self.searchWord, searchCount: self.maxGitHubRepositorySearchCount, page: self.gitHubRepositorySearchPageNumber) { response in
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
    func initAPIParameters() {
        self.gitHubRepositorySearchPageNumber = 1
        self.apiLoadStatus = .initial
        self.gitHubRepositorys = []
    }
}

// MARK: - UITableView DataSource Method

extension GitHubRepositorySearchViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.gitHubRepositorys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.gitHubRepositoryCell, for: indexPath)! // swiftlint:disable:this force_unwrapping
        if !self.gitHubRepositorys.isEmpty {
            cell.setUI(gitHubRepository: self.gitHubRepositorys[indexPath.row])
        }
        return cell
    }
}
