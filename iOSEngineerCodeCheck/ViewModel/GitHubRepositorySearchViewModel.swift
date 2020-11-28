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

class GitHubRepositorySearchViewModel {
    /// GitHubRepositoryのリポジトリクラス
    private let gitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol
    /// GitHubRepository一覧
    var gitHubRepositorys: [GitHubRepository] = []
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
