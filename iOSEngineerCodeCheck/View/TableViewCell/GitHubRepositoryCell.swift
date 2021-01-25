//
//  GitHubRepositoryCell.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubRepositoryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageIconView: UIView!
    @IBOutlet weak var updatedDateLabel: UILabel!

    /// セル高さ
    static let rowHeight: CGFloat = 120
    /// Dateヘルパー
    private let dateHelper = DateHelper()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Setting UI Method
extension GitHubRepositoryCell {
    private func initUI() {
        // 文字色の設定
        self.starLabel.textColor = .lightGray
        self.languageLabel.textColor = .lightGray
        self.updatedDateLabel.textColor = .lightGray
        // スター色の設定
        self.starImageView.tintColor = .gray
        // 言語アイコンの体裁設定
        self.languageIconView.backgroundColor = .gray
        self.languageIconView.clipsToBounds = true
        self.languageIconView.layer.cornerRadius = self.languageIconView.frame.width / 2
    }
    func setUI(gitHubRepository: GitHubRepository.Item) {
        self.titleLabel.text = gitHubRepository.name
        self.descriptionLabel.text = gitHubRepository.description
        self.starLabel.text = "\(gitHubRepository.starNumber ?? 0)"
        self.languageLabel.text = gitHubRepository.language
        self.updatedDateLabel.text = "updated: " + dateHelper.formatToString(date: gitHubRepository.updatedAt)
    }
}
