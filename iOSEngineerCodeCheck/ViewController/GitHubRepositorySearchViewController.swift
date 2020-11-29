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
    }
}
// MARK: - Private Method
extension GitHubRepositorySearchViewController {
    // GitHubRepository詳細ページへ遷移
    private func transitionGitHubRepositoryDetail() {
        let s = UIStoryboard(name: "GitHubRepositoryDetailViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! GitHubRepositoryDetailViewController
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
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.getRepositorys(searchWord: searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchWord: String = searchBar.text else { return }
        self.getRepositorys(searchWord: searchWord)
    }
}
// MARK: - UITableVIew Delegate Method
extension GitHubRepositorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.transitionGitHubRepositoryDetail()
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
