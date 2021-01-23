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
    /// GitHubRepositoryのリポジトリクラス
    private let gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol
    /// GitHubのリポジトリ一覧
    var gitHubRepositorys: [GitHubRepository.Item] = []
    /// GitHubRepositorySearchViewModelのデリゲート
    internal weak var delegate: GitHubRepositorySearchViewModelDelegate?
    /// GitHubリポジトリの検索結果最大取得数
    let maxGitHubRepositorySearchCount = 20

    init(gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol) {
        self.gitHubRepositorySearchRepository = gitHubRepositorySearchRepository
    }
}
// MARK: - API Method
extension GitHubRepositorySearchViewModel {
    /// GitHubRepositoryを取得する
    /// - Parameter request: APIのリクエスト
    func getGitHubRepositorys(request: URLRequest) {
        self.gitHubRepositorySearchRepository.getGitHubRepositorys(request: request) { response in
            switch response {
            case .success(let gitHubRepositorys):
                DispatchQueue.main.async { [weak self] in
                    self?.gitHubRepositorys = gitHubRepositorys
                    self?.delegate?.didSuccessGetGitHubRepositorys()
                }
            case .failure(let error):
                self.delegate?.didFailedGetGitHubRepositorys(errorMessage: "GitHubRepositoryの取得に失敗しました。" + "error=\(error.localizedDescription)")
            }
        }
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
