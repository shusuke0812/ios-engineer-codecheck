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

protocol StateProtocol {
    var error: Error? { get set }
}

struct AppState: StateProtocol {
    var repositoryState = RepositoryState()
    var error: Error?
}

struct RepositoryState: StateProtocol {
    var list = [GitHubRepository]()
    var error: Error?
}

// MARK: - Store

class Store<StoreState: StateProtocol>: NSObject {
    var reducer: Reducer<StoreState>
    var state: StoreState
    var middleware: [Middleware<StoreState>]

    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middleware: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middleware = middleware
    }

    func dispatch(action: ActionProtocol) {
        self.state = self.reducer(self.state, action)
        middleware.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
