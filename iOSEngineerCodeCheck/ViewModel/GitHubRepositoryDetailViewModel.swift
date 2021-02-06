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
    internal weak var delegate: GitHubRepositoryDetailViewModelDelegate?
    
    init(gitHubReadmeRepository: GitHubReadmeRepositoryProtocol) {
        self.gitHubReadmeRepository = gitHubReadmeRepository
    }
}
// MARK: - API Method
extension GitHubRepositoryDetailViewModel {
    /// GitHubリポジトリのREADMEを取得する
    /// - Parameter request: APIリクエスト
    func getGitHubReadme(request: URLRequest) {
        self.gitHubReadmeRepository.getRepositoryReadme(request: request) { response in
            switch response {
            case .success(let gitHubReadme):
                self.gitHubReadme = gitHubReadme
                self.delegate?.didSuccessGetReadme()
            case .failure(let error):
                self.delegate?.didFailedGetReadme(errorMessage: "GitHubリポジトリのREADMEの取得に失敗しました" + "error=\(error.localizedDescription)")
            }
        }
    }
}
