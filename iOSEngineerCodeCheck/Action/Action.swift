//
//  Action.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

protocol ActionProtocol {}

struct FetchRepositories: ActionProtocol {}

struct SetRepositories: ActionProtocol {
    let repositories: [GitHubRepository]
}
