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
    @IBOutlet weak var noRepositoryView: UIView!
    @IBOutlet weak var noRepositoryCommentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
}

// MARK: - Setting UI Method

extension GitHubRepositorySearchBaseView {
    private func initUI() {
        // 検索バーの入力値を初期化
        searchBar.text = ""
        // 検索バーのプレースホルダーを設定
        searchBar.placeholder = "GitHubのリポジトリを検索できるよー"
        // TableViewセル登録
        tableView.register(R.nib.gitHubRepositoryCell)
        setLodingCellWithStartingAnimation()
        // リポジトリ検索結果の表示
        noRepositoryView.isHidden = false
        noRepositoryCommentLabel.text = "リポジトリがないよー"
        noRepositoryCommentLabel.font = .boldSystemFont(ofSize: 17)
        noRepositoryCommentLabel.textColor = .lightGray
    }
    func setNoRepositoryUI(gitHubRepositorys: [GitHubRepository]) {
        gitHubRepositorys.isEmpty ? (noRepositoryView.isHidden = false) : (noRepositoryView.isHidden = true)
    }
    func setLodingCellWithStartingAnimation() {
        if tableView.tableFooterView == nil {
            tableView.register(R.nib.loadingCell)
            let footerCell: LoadingCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.loadingCell.identifier) as! LoadingCell // swiftlint:disable:this force_cast
            footerCell.startAnimation()
            tableView.tableFooterView = footerCell.contentView
        }
    }
    func cancelTableFooterView() {
        tableView.tableFooterView = nil
    }
}
