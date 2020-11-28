//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol GitHubRepositorySearchRepositoryProtocol {
    /// GitHubRepositoryを取得する
    /// - Parameter searchingWord: 検索単語
    func getGitHubRepositorys(searchingWord: String, completion: @escaping (Result<GitHubRepository, Error>) -> Void)
}
class GitHubRepositorySearchRepository: GitHubRepositorySearchRepositoryProtocol {
}
// MARK: - API Method
extension GitHubRepositorySearchRepository {
    internal func getGitHubRepositorys(searchingWord: String,
                                       completion: @escaping (Result<GitHubRepository, Error>) -> Void) {
    }
}
