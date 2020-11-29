//
//  GitHubRepositorySearchViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol GitHubRepositorySearchViewModelDelegate: class {
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
    
    init(gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol) {
        self.gitHubRepositorySearchRepository = gitHubRepositorySearchRepository
    }
}
// MARK: - API Method
extension GitHubRepositorySearchViewModel {
    /// GitHubRepositoryを取得する
    /// - Parameter urlString: APIのURL
    func getGitHubRepositorys(urlString: String) {
        self.gitHubRepositorySearchRepository
            .getGitHubRepositorys(urlString: urlString,
                                  completion: { response in
                                    switch response {
                                    case .success(let gitHubRepositorys):
                                        DispatchQueue.main.async { [weak self] in
                                            self?.gitHubRepositorys = gitHubRepositorys
                                            self?.delegate?.didSuccessGetGitHubRepositorys()
                                        }
                                    case .failure(let error):
                                        self.delegate?.didFailedGetGitHubRepositorys(errorMessage: "GitHubRepositoryの取得に失敗しました。\n" + "DEBUG: error=\(error)")
                                    }
                                  })
    }
}
// MARK: - UITableView DataSource Method
extension GitHubRepositorySearchViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gitHubRepositorys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitHubRepositoryCell", for: indexPath) as! GitHubRepositoryCell
        if !self.gitHubRepositorys.isEmpty {
            cell.setUI(gitHubRepository: self.gitHubRepositorys[indexPath.row])
        }
        return cell
    }
}
