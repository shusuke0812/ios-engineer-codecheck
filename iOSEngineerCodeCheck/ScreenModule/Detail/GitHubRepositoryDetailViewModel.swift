//
//  GitHubRepositoryDetailVewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/6.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol GitHubRepositoryDetailViewModelDelegate: AnyObject {
    func didSuccessGetReadme()
    func didFailedGetReadme(errorMessage: String)
}

class GitHubRepositoryDetailViewModel {
    private let gitHubReadmeRepository: GitHubReadmeRepositoryProtocol
    var gitHubReadme: GitHubReadme?

    weak var delegate: GitHubRepositoryDetailViewModelDelegate?

    init(gitHubReadmeRepository: GitHubReadmeRepositoryProtocol) {
        self.gitHubReadmeRepository = gitHubReadmeRepository
    }
}
// MARK: - API Method
extension GitHubRepositoryDetailViewModel {
    func getGitHubReadme(owner: String, repository: String) {
        gitHubReadmeRepository.getRepositoryReadme(owner: owner, repository: repository) { [weak self] response in
            guard let self = self else { return }
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
