//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositorySearchViewController: UIViewController {
    /// BaseView
    private var baseView: GitHubRepositorySearchBaseView { self.view as! GitHubRepositorySearchBaseView }
    /// ViewModel
    private var viewModel: GitHubRepositorySearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GitHubRepositorySearchViewModel(gitHubRepositorySearchRepository: GitHubRepositorySearchRepository())
        self.setDelegateDataSource()
        self.setNavigation()
    }
}
// MARK: - Private Method
extension GitHubRepositorySearchViewController {
    // ナビゲーションの設定
    private func setNavigation() {
        self.navigationItem.title = "リポジトリ一覧"
    }
    // GitHubRepository詳細ページへ遷移
    private func transitionGitHubRepositoryDetail(indexPath: IndexPath) {
        let s = UIStoryboard(name: "GitHubRepositoryDetailViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! GitHubRepositoryDetailViewController
        vc.gitHubRepository = self.viewModel.gitHubRepositorys[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // DelegateとDataSourceの登録
    private func setDelegateDataSource() {
        self.baseView.searchBar.delegate = self
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
        self.viewModel.delegate = self
    }
    private func getRepositorys(searchWord: String) {
        // リポジトリ検索のクエリとAPIパスを設定
        let quuery = "?q=\(searchWord)"
        let urlString = Common.ApiUrl.gitHubSearchApi + quuery
        self.viewModel.getGitHubRepositorys(urlString: urlString)
    }
}
// MARK: - UISearchBar Delegate Method
extension GitHubRepositorySearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // TODO: インクリメンタルサーチをしたときにAPIのレスポンスがエラーになる
        self.getRepositorys(searchWord: searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchWord: String = searchBar.text else { return }
        self.getRepositorys(searchWord: searchWord)
        // キーボードを閉じる
        self.baseView.searchBar.endEditing(true)
    }
}
// MARK: - UITableVIew Delegate Method
extension GitHubRepositorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.transitionGitHubRepositoryDetail(indexPath: indexPath)
        // セルの選択状態を解除
        self.baseView.tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - ViewModel Delegate Method
extension GitHubRepositorySearchViewController: GitHubRepositorySearchViewModelDelegate {
    func didSuccessGetGitHubRepositorys() {
        self.baseView.tableView.reloadData()
    }
    func didFailedGetGitHubRepositorys(errorMessage: String) {
        print("DEBUG: \(errorMessage)")
    }
}
