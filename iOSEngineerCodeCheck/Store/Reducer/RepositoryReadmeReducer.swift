//
//  RepositoryReadmeReducer.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/11/13.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

func repositoryReadmeReducer(_ state: RepositoryReadmeState, action: ActionProtocol) -> RepositoryReadmeState {
    var state = state

    switch action {
    case let action as SetRepositoryReadme:
        state.readme = action.readme
    default:
        break
    }

    return state
}
