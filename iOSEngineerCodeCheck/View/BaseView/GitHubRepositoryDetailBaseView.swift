//
//  GitHubRepositoryDetailBaseView.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailBaseView: UIView {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starNumberLabel: UILabel!
    @IBOutlet weak var watchNumberLabel: UILabel!
    @IBOutlet weak var forkNumberLabel: UILabel!
    @IBOutlet weak var issueNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Setting UI Method
extension GitHubRepositoryDetailBaseView {
    private func initUI() {
        let defauletNumber = 0
        self.avatarImageView.image = R.image.avatar_default()
        self.titleLabel.text = ""
        self.starNumberLabel.text = "\(defauletNumber)"
        self.watchNumberLabel.text = "\(defauletNumber)"
        self.forkNumberLabel.text = "\(defauletNumber)"
        self.issueNumberLabel.text = "\(defauletNumber)"
    }
    func setUI(gitHubRepository: GitHubRepository.Item) {
        self.avatarImageView.getImage(imageUrlString: gitHubRepository.owner?.avatarImage ?? "")
        self.titleLabel.text = gitHubRepository.name
        self.languageLabel.text = gitHubRepository.language
        let defauletNumber = 0
        self.starNumberLabel.text = "\(gitHubRepository.starNumber ?? defauletNumber)"
        self.watchNumberLabel.text = "\(gitHubRepository.watchNumber ?? defauletNumber)"
        self.forkNumberLabel.text = "\(gitHubRepository.forkNumber ?? defauletNumber)"
        self.issueNumberLabel.text = "\(gitHubRepository.isueNumber ?? defauletNumber)"
    }
}
