//
//  GitHubRepositorySearchBaseView.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositorySearchBaseView: UIView {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchErrorView: GitHubRepositorySearchErrorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Setting UI Method
extension GitHubRepositorySearchBaseView {
    private func initUI() {
        // 検索バーの入力値を初期化
        self.searchBar.text = ""
        // 検索バーのプレースホルダーを設定
        self.searchBar.placeholder = "GitHubのリポジトリを検索できるよー"
        // TableViewセル登録
        self.tableView.register(R.nib.gitHubRepositoryCell)
        self.setLodingCellWithStartingAnimation()
        // リポジトリ検索結果の表示
        self.searchErrorView.isHidden = false
        self.searchErrorView.delegate = self
        self.searchErrorView.updateErrorState(.ready)
    }
    func setNoRepositoryUI(gitHubRepositorys: [GitHubRepository]) {
        if !NetworkConnectivity.shared.isOnline {
            enabledSearchBar(enabled: false)
            searchErrorView.updateErrorState(.noNetwork)
            return
        }
        if gitHubRepositorys.isEmpty {
            searchErrorView.isHidden = false
            searchErrorView.updateErrorState(.noRepositories)
        } else {
            searchErrorView.isHidden = true
            searchErrorView.updateErrorState(.ready)
        }
        enabledSearchBar(enabled: true)
    }
    func setLodingCellWithStartingAnimation() {
        if self.tableView.tableFooterView == nil {
            self.tableView.register(R.nib.loadingCell)
            let footerCell: LoadingCell = self.tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.loadingCell.identifier) as! LoadingCell // swiftlint:disable:this force_cast
            footerCell.startAnimation()
            self.tableView.tableFooterView = footerCell.contentView
        }
    }
    func cancelTableFooterView() {
        self.tableView.tableFooterView = nil
    }
    func enabledSearchBar(enabled: Bool) {
        searchBar.searchTextField.isEnabled = enabled
    }
}

extension GitHubRepositorySearchBaseView: GitHubRepositorySearchErrorViewDelegate {
    func didTapRetryButton(_ view: GitHubRepositorySearchErrorView) {
        setNoRepositoryUI(gitHubRepositorys: [])
    }
}
