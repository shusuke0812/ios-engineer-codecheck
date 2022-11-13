//
//  Store.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2022/7/11.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import RxSwift

typealias Dispather = (ActionProtocol) -> Void
typealias Reducer<State: StateProtocol> = (_ state: State, _ action: ActionProtocol) -> State
typealias Middleware<StoreState: StateProtocol> = (StoreState, ActionProtocol, @escaping Dispather) -> Void

// MARK: - State

protocol StateProtocol {
    var error: Error? { get set }
}

struct AppState: StateProtocol {
    var repositoryState = RepositoryState()
    var repositoryReadmeState = RepositoryReadmeState()
    var repositoryLicenseState = RepositoryLicenseState()
    var error: Error?
}

struct RepositoryState: StateProtocol {
    var list = [GitHubRepository]()
    var error: Error?
}

struct RepositoryReadmeState: StateProtocol {
    var readme = GitHubReadme(htmlUrl: "")
    var error: Error?
}

struct RepositoryLicenseState: StateProtocol {
    var license = GitHubLicense(description: "", body: "")
    var error: Error?
}

// MARK: - Store

/// アプリケーション全体の状態を管理する
/// - Reducer, State, Middlewareを保持し、アプリ全体でただ一つ存在するもの。そのため、どのViewからもアクセスできるようにAppRootControllerで保持するように実装されている。
class AppStore<StoreState: StateProtocol>: NSObject {
    private var reducer: Reducer<StoreState>
    private(set) var state: StoreState
    private var middleware: [Middleware<StoreState>]

    private let subject = PublishSubject<StoreState>()
    private let dispoaseBag = RxSwift.DisposeBag()
    var nextState: Observable<StoreState> { subject.asObservable() }

    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middleware: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middleware = middleware
    }

    func dispatch(action: ActionProtocol) {
        state = reducer(state, action)
        subject.onNext(state)

        middleware.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
