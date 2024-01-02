//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import PKHUD
import RxSwift
import GitHubGraphQL

class GitHubRepositorySearchViewController: UIViewController, AppStoreAccessible {
    private var baseView: GitHubRepositorySearchBaseView { view as! GitHubRepositorySearchBaseView } // swiftlint:disable:this force_cast
    private let disposeBag = RxSwift.DisposeBag()

    private var onKeyboard = false
    private var repositories: [GitHubRepository] {
        store.state.repositoryState.list
    }

    // MARK: Redux
    private struct Props {
        let repositories: [GitHubRepository]
        let fetchRepositories: () -> Void
    }
    private func map(state: RepositoryState, request: SearchRepositoriesRequest) -> Props {
        Props(repositories: state.list) { [weak self] in
            self?.store.dispatch(action: FetchRepositories(request: request))
        }
    }

    // MARK: Lifecycle Method

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateDataSource()
        setNavigation()
        setDissmissKeyboard()
        setObservers()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !onKeyboard {
            baseView.searchBar.becomeFirstResponder()
            onKeyboard = true
        }
    }
}

// MARK: - Initialized

extension GitHubRepositorySearchViewController {
    private func setNavigation() {
        navigationItem.title = "リポジトリ一覧"
    }

    private func setDelegateDataSource() {
        baseView.searchBar.delegate = self
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }

    private func setObservers() {
        store.nextState.subscribe(
            onNext: { [weak self] _state in
                guard let _self = self else { return }
                DispatchQueue.main.async {
                    _self.baseView.setNoRepositoryUI(gitHubRepositorys: _state.repositoryState.list)
                    _self.baseView.tableView.reloadData()
                }
            },
            onError: nil,
            onCompleted: nil
        )
        .disposed(by: disposeBag)
    }
}

// MARK: - Transition

extension GitHubRepositorySearchViewController {
    private func transitionGitHubRepositoryDetail(indexPath: IndexPath) {
        let vc = GitHubRepositoryDetailViewController.instantiate(gitHubRepository: repositories[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    private func showGitHubRepositoryDetail(indexPath: IndexPath) {
        let vc = GitHubRepositoryDetailViewController.instantiate(gitHubRepository: repositories[indexPath.row])
        splitViewController?.showDetailViewController(vc, sender: nil)
    }
}

// MARK: - FetchAction

extension GitHubRepositorySearchViewController {
    private func getRepositorys(searchWord: String) {
        if baseView.tableView.tableFooterView == nil {
            baseView.setLodingCellWithStartingAnimation()
        }

        let request = SearchRepositoriesRequest(searchWord: searchWord, searchCount: 20, page: 1)
        let props = map(state: store.state.repositoryState, request: request)
        props.fetchRepositories()
        // TODO: API fetch前後でHUDを表示させるようにする
    }
    private func setNoRepository() {
        baseView.setNoRepositoryUI(gitHubRepositorys: repositories)
    }
    private func searchRepositorys(searchText: String) {
        // 空文字""だと検索エラーになるのでAPIは発行しない
        if searchText.isEmpty {
            setNoRepository()
        } else {
            getRepositorys(searchWord: searchText)
            samleGraphQLFetch(searchText: searchText)
        }
    }
    // NOTE: GraphQL fetch デバッグ用
    private func samleGraphQLFetch(searchText: String) {
        let query = GitHubReposQuery(query: searchText, type: .case(.repository), first: 20)
        let graphQLRequest = GraphQLSearchRequest(query: query)

        let repository = GitHubRepositorySearchRepository()
        repository.getGitHubRepositories(request: graphQLRequest) { result in
            switch result {
            case .success(let response):
                if let optionalNodes = response?.search.nodes {
                    let nodes = optionalNodes.compactMap { $0 }
                    nodes.forEach { node in
                        print("DEBUG: repository_name=\(String(describing: node.asRepository?.nameWithOwner))")
                    }
                }
            case .failure(let error):
                print("DEBUG: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - UISearchBarDelegate

extension GitHubRepositorySearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //　インクリメンタルサーチの定義：0.5秒以内に入力された連続的なデータでリクエスを発行しないようにする
        // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        //     self.searchRepositorys(searchText: searchText)
        // }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText: String = searchBar.text else { return }
        searchRepositorys(searchText: searchText)
        baseView.searchBar.endEditing(true)
    }
}

// MARK: - UITableVIewDelegate

extension GitHubRepositorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch DeviceJudgeHelper.getType {
        case .phone: transitionGitHubRepositoryDetail(indexPath: indexPath)
        case .pad: showGitHubRepositoryDetail(indexPath: indexPath)
        default: return
        }
        baseView.tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        GitHubRepositoryCell.rowHeight
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffsetY = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.height
        let distanceToBottom = maximumOffset - currentOffsetY
        if distanceToBottom < 0 && baseView.tableView.isDragging {
            // TODO: fetch処理追加
        }
    }
}

// MARK: - UITableViewDataSource

extension GitHubRepositorySearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.gitHubRepositoryCell, for: indexPath)! // swiftlint:disable:this force_unwrapping
        if !store.state.repositoryState.list.isEmpty {
            cell.setUI(gitHubRepository: repositories[indexPath.row])
        }
        return cell
    }
}
