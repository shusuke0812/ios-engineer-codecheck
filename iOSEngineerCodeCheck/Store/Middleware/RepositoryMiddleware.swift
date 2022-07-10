//
//  RepositoryMiddleware.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

func repositoryMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case _ as FetchRepositories:
            let searchWord = "swift"
            let searchCount = 10
            let page = 1
            GitHubRepositorySearchRepository().getGitHubRepositorys(searchWord: searchWord, searchCount: searchCount, page: page) { result in
                switch result {
                case .success(let repository):
                    dispatch(SetRepositories(repositories: repository.items))
                case .failure(let error):
                    print(error.description())
                }
            }
        default:
            break
        }
    }
}
