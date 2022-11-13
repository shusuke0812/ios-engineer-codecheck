//
//  RepositoryMiddleware.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

func repositoryMiddleware() -> Middleware<AppState> {
    { _, action, dispatch in
        switch action {
        case let fetchAction as FetchRepositories:
            GitHubRepositorySearchRepository().getGitHubRepositorys(request: fetchAction.request) { result in
                switch result {
                case .success(let repository):
                    dispatch(SetRepositories(repositories: repository.items))
                case .failure(let error):
                    print(error.description())
                }
            }
        case let fetchAction as FetchRepositoryReadme:
            GitHubReadmeRepository().getRepositoryReadme(request: fetchAction.request) { result in
                switch result {
                case .success(let readme):
                    dispatch(SetRepositoryReadme(readme: readme))
                case .failure(let error):
                    print(error.description())
                }
            }
        default:
            break
        }
    }
}
