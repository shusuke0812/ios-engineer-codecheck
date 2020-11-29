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
    
    var gitHubRepository: GitHubRepository!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
}
// MARK: - Private Method
extension GitHubRepositoryDetailViewController {
    private func setUI() {
        self.baseView.setUI(gitHubRepository: self.gitHubRepository)
    }
}
