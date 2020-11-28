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
        // TableViewセル登録
        self.tableView.register(UINib(nibName: "GitHubRepositoryCell", bundle: nil), forCellReuseIdentifier: "GitHubRepositoryCell")
    }
    func setUI() {
    }
}
