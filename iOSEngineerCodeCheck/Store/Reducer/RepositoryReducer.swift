//
//  RepositoryReducer.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

func repositoryReducer(_ state: RepositoryState, action: ActionProtocol) -> RepositoryState {
    var state = state

    switch action {
    case let action as SetRepositories:
        state.list = action.repositories
    default:
        break
    }

    return state
}
