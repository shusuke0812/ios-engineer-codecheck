//
//  AppReducer.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

func appReducer(_ state: AppState, _ action: ActionProtocol) -> AppState {
    var state = state
    state.repositoryState = repositoryReducer(state.repositoryState, action: action)
    return state
}
