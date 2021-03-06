//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import PKHUD

class GitHubRepositorySearchViewController: UIViewController {
    /// BaseView
    private var baseView: GitHubRepositorySearchBaseView { self.view as! GitHubRepositorySearchBaseView } // swiftlint:disable:this force_cast
    /// ViewModel
    private var viewModel: GitHubRepositorySearchViewModel!
    /// キーボード起動フラグ
    private var onKeyboard: Bool = false

    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GitHubRepositorySearchViewModel(gitHubRepositorySearchRepository: GitHubRepositorySearchRepository())
        self.setDelegateDataSource()
        self.setNavigation()
        self.setDissmissKeyboard()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面起動時にSearchFieldをONにしてキーボードを立ちげる（UI/UX向上）
        if !onKeyboard {
            self.baseView.searchBar.becomeFirstResponder()
            self.onKeyboard = true
        }
    }
}
// MARK: - Initialized Method
extension GitHubRepositorySearchViewController {
    // ナビゲーションの設定
    private func setNavigation() {
        self.navigationItem.title = "リポジトリ一覧"
    }
    // DelegateとDataSourceの登録
    private func setDelegateDataSource() {
        self.baseView.searchBar.delegate = self
        self.baseView.tableView.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
        self.viewModel.delegate = self
    }
}
// MARK: - Private Method
extension GitHubRepositorySearchViewController {
    // GitHubRepository詳細ページへ遷移（iPhone）
    private func transitionGitHubRepositoryDetail(indexPath: IndexPath) {
        guard let vc = R.storyboard.gitHubRepositoryDetailViewController.instantiateInitialViewController() else { return }
        vc.gitHubRepository = self.viewModel.gitHubRepositorys[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // GitHubRepository詳細ページをスプリットで表示（iPad）
    private func showGitHubRepositoryDetail(indexPath: IndexPath) {
        guard let vc = R.storyboard.gitHubRepositoryDetailViewController.instantiateInitialViewController() else { return }
        vc.gitHubRepository = self.viewModel.gitHubRepositorys[indexPath.row]
        self.splitViewController?.showDetailViewController(vc, sender: nil)
    }
    // リポジトリ検索APIを呼ぶ
    private func getRepositorys(searchText: String) {
        // HUD表示（始）
        HUD.show(.progress)
        // TableFooterViewにActivtyIindicatorを設定
        if self.baseView.tableView.tableFooterView == nil {
            self.baseView.setLodingCellWithStartingAnimation()
        }
        // APIコール
        self.viewModel.initAPIParameters()
        self.viewModel.searchWord = searchText
        self.viewModel.getGitHubRepositorys()
    }
    // リポジトリがない場合の処理
    private func setNoRepository() {
        self.viewModel.initAPIParameters()
        self.baseView.setNoRepositoryUI(gitHubRepositorys: self.viewModel.gitHubRepositorys)
    }
    // リポジトリ検索ハンドル
    private func searchRepositorys(searchText: String) {
        // 空文字""だと検索エラーになるのでAPIは発行しない
        if searchText.isEmpty {
            self.setNoRepository()
        } else {
            self.getRepositorys(searchText: searchText)
        }
    }
}
// MARK: - UISearchBar Delegate Method
extension GitHubRepositorySearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //　インクリメンタルサーチの定義：0.5秒以内に入力された連続的なデータでリクエスを発行しないようにする
        // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        //     self.searchRepositorys(searchText: searchText)
        // }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText: String = searchBar.text else { return }
        self.searchRepositorys(searchText: searchText)
        // キーボードを閉じる
        self.baseView.searchBar.endEditing(true)
    }
}
// MARK: - UITableVIew Delegate Method
extension GitHubRepositorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // リポジトリ一覧セルをタップして詳細ページを表示させる
        switch DeviceJudgeHelper.getType {
        case .phone: self.transitionGitHubRepositoryDetail(indexPath: indexPath)
        case .pad: self.showGitHubRepositoryDetail(indexPath: indexPath)
        default: return
        }
        // セルの選択状態を解除
        self.baseView.tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        GitHubRepositoryCell.rowHeight
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffsetY = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.height
        let distanceToBottom = maximumOffset - currentOffsetY
        if distanceToBottom < 0 && self.baseView.tableView.isDragging {
            self.viewModel.getGitHubRepositorys()
        }
    }
}
// MARK: - ViewModel Delegate Method
extension GitHubRepositorySearchViewController: GitHubRepositorySearchViewModelDelegate {
    func didSuccessGetGitHubRepositorys() {
        DispatchQueue.main.async {
            self.baseView.setNoRepositoryUI(gitHubRepositorys: self.viewModel.gitHubRepositorys)
            if self.viewModel.apiLoadStatus == .full {
                self.baseView.cancelTableFooterView()
            }
            self.baseView.tableView.reloadData()
            // HUD表示（終）
            HUD.hide()
        }
    }
    func didFailedGetGitHubRepositorys(errorMessage: String) {
        print("DEBUG: \(errorMessage)")
        DispatchQueue.main.async {
            // HUD表示（終）
            HUD.hide()
            // 失敗メッセージをアラート表示
            UIAlertController.showAlert(style: .alert, viewController: self, title: errorMessage, message: nil, okButtonTitle: "OK", cancelButtonTitle: nil)
        }
    }
}
