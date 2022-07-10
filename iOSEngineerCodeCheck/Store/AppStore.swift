//
//  Store.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

typealias Dispather = (ActionProtocol) -> Void
typealias Reducer<State: StateProtocol> = (_ state: State, _ action: ActionProtocol) -> State
typealias Middleware<StoreState: StateProtocol> = (StoreState, ActionProtocol, @escaping Dispather) -> Void

// MARK: - State

protocol StateProtocol {}

struct AppState: StateProtocol {
    var repositoryState = RepositoryState()
}

struct RepositoryState: StateProtocol {
    var list = [GitHubRepository]()
}

// MARK: - Store

class Store<StoreState: StateProtocol>: NSObject {
    
}
