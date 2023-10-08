//
//  Action.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol ActionProtocol {}

// MARK: - Fetch repository

struct FetchRepositories: ActionProtocol {
    let request: SearchRepositoriesRequest
}

struct GraphQLFetchRepositories: ActionProtocol {
    let request: GraphQLSearchRequest
}

struct SetRepositories: ActionProtocol {
    let repositories: [GitHubRepository]
}

// MARK: - Fetch repository README

struct FetchRepositoryReadme: ActionProtocol {
    let request: GetRepositoryReadmeRequest
}

struct SetRepositoryReadme: ActionProtocol {
    let readme: GitHubReadme
}

// MARK: - Fetch repository LICENSE

struct FetchRepositoryLicense: ActionProtocol {
    let request: LicenseRequest
}

struct SetRepositoryLicense: ActionProtocol {
    let license: GitHubLicense
}
