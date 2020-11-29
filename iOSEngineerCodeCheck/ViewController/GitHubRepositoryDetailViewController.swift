//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailViewController: UIViewController {
    /// BaseView
    private var baseView: GitHubRepositoryDetailBaseView { self.view as! GitHubRepositoryDetailBaseView}
    /// GitHubのリポジトリ
    var gitHubRepository: GitHubRepository.Item!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.setUI()
    }
}
// MARK: - Private Method
extension GitHubRepositoryDetailViewController {
    // ナビゲーションの設定
    private func setNavigation() {
        self.navigationItem.title = "リポジトリ詳細"
    }
    private func setUI() {
        self.baseView.setUI(gitHubRepository: self.gitHubRepository)
    }
}
