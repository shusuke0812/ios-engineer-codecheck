//
//  GitHubRepositoryCell.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositoryCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var language: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Setting UI Method
extension GitHubRepositoryCell {
    func setUI(gitHubRepository: GitHubRepository.Item) {
        self.title.text = gitHubRepository.name
        self.language.text = gitHubRepository.language
    }
}
