//
//  GitHubRepositoryDetailBaseView.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol GitHubRepositoryDetailBaseViewDelegate: AnyObject {
    /// ホームページボタンをタップした時の処理
    func didTapHomePageButton()
    /// お気に入りボタンをタップした時の処理
    func didTapStarButton()
    /// LICENSEセルをタップした時の処理
    func didTapLicenseCell()
}

class GitHubRepositoryDetailBaseView: UIView {
    // ヘッダー部
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var homePageButton: UIButton!
    @IBOutlet weak var languageIconView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    // お気に入りボタン
    @IBOutlet weak var starButton: UIButton!
    // ボディー部
    @IBOutlet weak var starIconImageView: UIImageView!
    @IBOutlet weak var starNumberLabel: UILabel!
    @IBOutlet weak var watchIconImageView: UIImageView!
    @IBOutlet weak var watchNumberLabel: UILabel!
    @IBOutlet weak var forkIconImageView: UIImageView!
    @IBOutlet weak var forkNumberLabel: UILabel!
    @IBOutlet weak var issueIconImageView: UIImageView!
    @IBOutlet weak var issueNumberLabel: UILabel!
    @IBOutlet weak var licenseIconImageView: UIImageView!
    @IBOutlet weak var licenseLabel: UILabel!
    /// デリゲート
    internal weak var delegate: GitHubRepositoryDetailBaseViewDelegate?

    // MARK: - Lifecycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initHeaderUI()
        self.initStarButton()
        self.initBodyUI()
    }
    // MARK: - Action Method
    @IBAction private func didTapHomePageButton(_ sender: Any) {
        self.delegate?.didTapHomePageButton()
    }
    @IBAction private func didTapStarButton(_ sender: Any) {
        self.delegate?.didTapStarButton()
    }
    @IBAction private func didTapLicenseCell(_ sender: Any) {
        self.delegate?.didTapLicenseCell()
    }
}
// MARK: - Initialized Method
extension GitHubRepositoryDetailBaseView {
    private func initHeaderUI() {
        // アバターアイコンの設定
        self.avatarImageView.image = R.image.avatar_default()
        // 各種テキストの設定
        self.titleLabel.text = ""
        self.descriptionLabel.text = ""
        self.homePageButton.setTitle("", for: .normal)
        self.languageLabel.text = ""
        // 言語アイコンの体裁設定
        self.languageIconView.clipsToBounds = true
        self.languageIconView.layer.cornerRadius = self.languageIconView.frame.width / 2
    }
    private func initStarButton() {
        self.starButton.clipsToBounds = true
        self.starButton.layer.cornerRadius = 5
        self.starButton.layer.borderColor = UIColor.lightGray.cgColor
        self.starButton.layer.borderWidth = 1.0
    }
    private func initBodyUI() {
        let defauletNumber = 0
        self.starNumberLabel.text = "\(defauletNumber)"
        self.watchNumberLabel.text = "\(defauletNumber)"
        self.forkNumberLabel.text = "\(defauletNumber)"
        self.issueNumberLabel.text = "\(defauletNumber)"
        self.licenseLabel.text = "NO LICENSE"
    }
}
// MARK: - Setting UI Method
extension GitHubRepositoryDetailBaseView {
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
