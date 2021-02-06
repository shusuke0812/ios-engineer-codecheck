//
//  GitHubRepositoryDetailBaseView.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/27.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import WebKit
import FontAwesome_swift

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
    // フッター部
    @IBOutlet weak var webView: WKWebView!
    /// デリゲート
    internal weak var delegate: GitHubRepositoryDetailBaseViewDelegate?
    /// テキストHelper
    private let textHelper = TextHelper()

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
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.layer.cornerRadius = 5
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
        // ラベルの設定
        let defauletNumber = 0
        self.starNumberLabel.text = "\(defauletNumber)"
        self.watchNumberLabel.text = "\(defauletNumber)"
        self.forkNumberLabel.text = "\(defauletNumber)"
        self.issueNumberLabel.text = "\(defauletNumber)"
        self.licenseLabel.text = "NO LICENSE"
        // アイコンの設定（TODO: うまくまとめられないか？）
        // MEMO: fontawesomeのstyleを.regularにすると表示されないバグあり（原因不明）
        let iconSize = CGSize(width: 25, height: 25)
        let cornerRadius: CGFloat = 5
        // スター
        self.starIconImageView.clipsToBounds = true
        self.starIconImageView.layer.cornerRadius = cornerRadius
        self.starIconImageView.backgroundColor = .systemBlue
        self.starIconImageView.image = UIImage.fontAwesomeIcon(name: .star, style: .solid, textColor: .white, size: iconSize)
        // ウォッチ
        self.watchIconImageView.clipsToBounds = true
        self.watchIconImageView.layer.cornerRadius = cornerRadius
        self.watchIconImageView.backgroundColor = .systemYellow
        self.watchIconImageView.image = UIImage.fontAwesomeIcon(name: .eye, style: .solid, textColor: .white, size: iconSize)
        // フォーク
        self.forkIconImageView.clipsToBounds = true
        self.forkIconImageView.layer.cornerRadius = cornerRadius
        self.forkIconImageView.backgroundColor = .systemGreen
        self.forkIconImageView.image = UIImage.fontAwesomeIcon(name: .codeBranch, style: .solid, textColor: .white, size: iconSize)
        // イシュー
        self.issueIconImageView.clipsToBounds = true
        self.issueIconImageView.layer.cornerRadius = cornerRadius
        self.issueIconImageView.backgroundColor = .systemOrange
        self.issueIconImageView.image = UIImage.fontAwesomeIcon(name: .infoCircle, style: .solid, textColor: .white, size: iconSize)
        // ライセンス
        self.licenseIconImageView.clipsToBounds = true
        self.licenseIconImageView.layer.cornerRadius = cornerRadius
        self.licenseIconImageView.backgroundColor = .systemRed
        self.licenseIconImageView.image = UIImage.fontAwesomeIcon(name: .balanceScale, style: .solid, textColor: .white, size: iconSize)
    }
}
// MARK: - Setting UI Method
extension GitHubRepositoryDetailBaseView {
    func setUI(gitHubRepository: GitHubRepository.Item) {
        self.setHeaderUI(gitHubRepository: gitHubRepository)
        self.setBodyUI(gitHubRepository: gitHubRepository)
    }
    private func setHeaderUI(gitHubRepository: GitHubRepository.Item) {
        self.avatarImageView.getImage(imageUrlString: gitHubRepository.owner?.avatarImage ?? "")
        self.titleLabel.text = gitHubRepository.fullName
        self.descriptionLabel.text = gitHubRepository.description
        if let homePageUrl = gitHubRepository.homePage {
            if homePageUrl.isEmpty {
                self.homePageButton.setTitle("-", for: .normal)
                self.homePageButton.isEnabled = false
            } else {
                self.homePageButton.setTitle(homePageUrl, for: .normal)
            }
        } else {
            self.homePageButton.setTitle("-", for: .normal)
            self.homePageButton.isEnabled = false
        }
        self.languageLabel.text = gitHubRepository.language
        self.setLanguageIconColor(language: gitHubRepository.language)
    }
    private func setBodyUI(gitHubRepository: GitHubRepository.Item) {
        let defauletNumber = 0
        self.starNumberLabel.text = textHelper.formatToCSV(value: gitHubRepository.starNumber ?? defauletNumber)
        self.watchNumberLabel.text = textHelper.formatToCSV(value: gitHubRepository.watchNumber ?? defauletNumber)
        self.forkNumberLabel.text = textHelper.formatToCSV(value: gitHubRepository.forkNumber ?? defauletNumber)
        self.issueNumberLabel.text = textHelper.formatToCSV(value: gitHubRepository.isueNumber ?? defauletNumber)
        self.licenseLabel.text = gitHubRepository.license?.name
    }
    private func setLanguageIconColor(language: String?) {
        guard let language = language else { return }
        self.languageIconView.backgroundColor = LanguageIcon(language: language).color
    }
    func setReadmeWebView(urlString: String) {
        if let url = URL(string: urlString) {
            self.webView.load(URLRequest(url: url))
        }
    }
}
