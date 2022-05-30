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
    private var baseView: GitHubRepositorySearchBaseView { view as! GitHubRepositorySearchBaseView } // swiftlint:disable:this force_cast
    /// ViewModel
    private var viewModel: GitHubRepositorySearchViewModel!
    /// キーボード起動フラグ
    private var onKeyboard: Bool = false

    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GitHubRepositorySearchViewModel(gitHubRepositorySearchRepository: GitHubRepositorySearchRepository())
        setDelegateDataSource()
        setNavigation()
        setDissmissKeyboard()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面起動時にSearchFieldをONにしてキーボードを立ちげる（UI/UX向上）
        if !onKeyboard {
            baseView.searchBar.becomeFirstResponder()
            onKeyboard = true
        }
    }
}
// MARK: - Initialized Method
extension GitHubRepositorySearchViewController {
    // ナビゲーションの設定
    private func setNavigation() {
        navigationItem.title = "リポジトリ一覧"
    }
    // DelegateとDataSourceの登録
    private func setDelegateDataSource() {
        baseView.searchBar.delegate = self
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = viewModel
        viewModel.delegate = self
    }
}
// MARK: - Private Method
extension GitHubRepositorySearchViewController {
    // GitHubRepository詳細ページへ遷移（iPhone）
    private func transitionGitHubRepositoryDetail(indexPath: IndexPath) {
        let vc = GitHubRepositoryDetailViewController.instantiate(gitHubRepository: viewModel.gitHubRepositorys[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    // GitHubRepository詳細ページをスプリットで表示（iPad）
    private func showGitHubRepositoryDetail(indexPath: IndexPath) {
        let vc = GitHubRepositoryDetailViewController.instantiate(gitHubRepository: viewModel.gitHubRepositorys[indexPath.row])
        splitViewController?.showDetailViewController(vc, sender: nil)
    }
    // リポジトリ検索APIを呼ぶ
    private func getRepositorys(searchText: String) {
        // HUD表示（始）
        HUD.show(.progress)
        // TableFooterViewにActivtyIindicatorを設定
        if baseView.tableView.tableFooterView == nil {
            baseView.setLodingCellWithStartingAnimation()
        }
        // APIコール
        viewModel.initAPIParameters()
        viewModel.searchWord = searchText
        if #available(iOS 15.0, *) {
            viewModel.async_getGitHubRepositorys()
        } else {
            viewModel.getGitHubRepositorys()
        }
    }
    // リポジトリがない場合の処理
    private func setNoRepository() {
        viewModel.initAPIParameters()
        baseView.setNoRepositoryUI(gitHubRepositorys: viewModel.gitHubRepositorys)
    }
    // リポジトリ検索ハンドル
    private func searchRepositorys(searchText: String) {
        // 空文字""だと検索エラーになるのでAPIは発行しない
        if searchText.isEmpty {
            setNoRepository()
        } else {
            getRepositorys(searchText: searchText)
        }
    }
}
// MARK: - UISearchBar Delegate Method
extension GitHubRepositorySearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //　インクリメンタルサーチの定義：0.5秒以内に入力された連続的なデータでリクエスを発行しないようにする
        // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        //     searchRepositorys(searchText: searchText)
        // }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText: String = searchBar.text else { return }
        searchRepositorys(searchText: searchText)
        // キーボードを閉じる
        baseView.searchBar.endEditing(true)
    }
}
// MARK: - UITableVIew Delegate Method
extension GitHubRepositorySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // リポジトリ一覧セルをタップして詳細ページを表示させる
        switch DeviceJudgeHelper.getType {
        case .phone: transitionGitHubRepositoryDetail(indexPath: indexPath)
        case .pad: showGitHubRepositoryDetail(indexPath: indexPath)
        default: return
        }
        // セルの選択状態を解除
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
            viewModel.getGitHubRepositorys()
        }
    }
}
// MARK: - ViewModel Delegate Method
extension GitHubRepositorySearchViewController: GitHubRepositorySearchViewModelDelegate {
    func didSuccessGetGitHubRepositorys() {
        DispatchQueue.main.async {
            baseView.setNoRepositoryUI(gitHubRepositorys: viewModel.gitHubRepositorys)
            if viewModel.apiLoadStatus == .full {
                baseView.cancelTableFooterView()
            }
            baseView.tableView.reloadData()
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
