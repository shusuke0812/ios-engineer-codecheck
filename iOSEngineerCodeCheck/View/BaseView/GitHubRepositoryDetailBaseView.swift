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
    @IBOutlet var repositoryInformationIconImageViews: [UIImageView]!
    @IBOutlet var repositoryInformationLabels: [UILabel]!
    // フッター部
    @IBOutlet weak var webView: WKWebView!
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
        for information in RepositoryDetail.informations {
            switch information {
            case .license:
                self.repositoryInformationLabels[information.rawValue].text = "NO LICENSE"
            default:
                self.repositoryInformationLabels[information.rawValue].text = "\(defauletNumber)"
            }
        }
        // MEMO: fontawesomeのstyleを.regularにすると表示されないバグあり（原因不明）
        let cornerRadius: CGFloat = 5
        for information in RepositoryDetail.informations {
            self.repositoryInformationIconImageViews[information.rawValue].clipsToBounds = true
            self.repositoryInformationIconImageViews[information.rawValue].layer.cornerRadius = cornerRadius
            self.repositoryInformationIconImageViews[information.rawValue].backgroundColor = information.iconColor
            self.repositoryInformationIconImageViews[information.rawValue].image = information.iconImage
        }
    }
}
// MARK: - Setting UI Method
extension GitHubRepositoryDetailBaseView {
    func setUI(gitHubRepository: GitHubRepository) {
        self.setHeaderUI(gitHubRepository: gitHubRepository)
        self.setBodyUI(gitHubRepository: gitHubRepository)
    }
    private func setHeaderUI(gitHubRepository: GitHubRepository) {
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
    private func setBodyUI(gitHubRepository: GitHubRepository) {
        let defauletNumber = 0
        for information in RepositoryDetail.informations {
            switch information {
            case .license:
                self.repositoryInformationLabels[information.rawValue].text = information.text(gitHubRepository: gitHubRepository).name
            default:
                self.repositoryInformationLabels[information.rawValue].text = TextHelper.shared.formatToCSV(value: information.text(gitHubRepository: gitHubRepository).number[information.rawValue] ?? defauletNumber)
            }
        }
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
