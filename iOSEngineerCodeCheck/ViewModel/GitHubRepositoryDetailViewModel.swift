//
//  GitHubRepositoryDetailVewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/6.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailViewModelDelegate: AnyObject {
    /// リポジトリのREADMEの取得に成功した
    func didSuccessGetReadme()
    /// リポジトリのREADMEの取得に失敗した
    /// - Parameter errorMessage: エラーメッセージ
    func didFailedGetReadme(errorMessage: String)
}

class GitHubRepositoryDetailViewModel {
    /// GitHubREADMEのリポジトリクラス
    private let gitHubReadmeRepository: GitHubReadmeRepositoryProtocol
    /// GitHubREADME
    var gitHubReadme: GitHubReadme?
    /// デリゲート
    weak var delegate: GitHubRepositoryDetailViewModelDelegate?

    init(gitHubReadmeRepository: GitHubReadmeRepositoryProtocol) {
        self.gitHubReadmeRepository = gitHubReadmeRepository
    }
}
// MARK: - API Method
extension GitHubRepositoryDetailViewModel {
    /// GitHubリポジトリのREADMEを取得する
    /// - Parameter request: APIリクエスト
    func getGitHubReadme(owner: String, repository: String) {
        self.gitHubReadmeRepository.getRepositoryReadme(owner: owner, repository: repository) { response in
            switch response {
            case .success(let gitHubReadme):
                self.gitHubReadme = gitHubReadme
                self.delegate?.didSuccessGetReadme()
            case .failure(let error):
                print("DEBUG: ", error)
                self.delegate?.didFailedGetReadme(errorMessage: error.description())
            }
        }
    }
}
