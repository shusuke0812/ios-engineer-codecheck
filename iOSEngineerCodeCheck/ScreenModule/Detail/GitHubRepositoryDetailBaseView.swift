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
    func didTapHomePageButton()
    func didTapStarButton()
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
    weak var delegate: GitHubRepositoryDetailBaseViewDelegate?

    // MARK: - Lifecycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        initHeaderUI()
        initStarButton()
        initBodyUI()
    }

    // MARK: - Action Method

    @IBAction private func didTapHomePageButton(_ sender: Any) {
        delegate?.didTapHomePageButton()
    }
    @IBAction private func didTapStarButton(_ sender: Any) {
        delegate?.didTapStarButton()
    }
    @IBAction private func didTapLicenseCell(_ sender: Any) {
        delegate?.didTapLicenseCell()
    }
}

// MARK: - Initialized Method

extension GitHubRepositoryDetailBaseView {
    private func initHeaderUI() {
        // アバターアイコンの設定
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 5
        avatarImageView.image = R.image.avatar_default()
        // 各種テキストの設定
        titleLabel.text = ""
        descriptionLabel.text = ""
        homePageButton.setTitle("", for: .normal)
        languageLabel.text = ""
        // 言語アイコンの体裁設定
        languageIconView.clipsToBounds = true
        languageIconView.layer.cornerRadius = languageIconView.frame.width / 2
    }
    private func initStarButton() {
        starButton.clipsToBounds = true
        starButton.layer.cornerRadius = 5
        starButton.layer.borderColor = UIColor.lightGray.cgColor
        starButton.layer.borderWidth = 1.0
    }
    private func initBodyUI() {
        // ラベルの設定
        let defauletNumber = 0
        for information in RepositoryDetail.informations {
            switch information {
            case .license:
                repositoryInformationLabels[information.rawValue].text = "NO LICENSE"
            default:
                repositoryInformationLabels[information.rawValue].text = "\(defauletNumber)"
            }
        }
        // MEMO: fontawesomeのstyleを.regularにすると表示されないバグあり（原因不明）
        let cornerRadius: CGFloat = 5
        for information in RepositoryDetail.informations {
            repositoryInformationIconImageViews[information.rawValue].clipsToBounds = true
            repositoryInformationIconImageViews[information.rawValue].layer.cornerRadius = cornerRadius
            repositoryInformationIconImageViews[information.rawValue].backgroundColor = information.iconColor
            repositoryInformationIconImageViews[information.rawValue].image = information.iconImage
        }
    }
}

// MARK: - Setting UI Method

extension GitHubRepositoryDetailBaseView {
    func setUI(gitHubRepository: GitHubRepository) {
        setHeaderUI(gitHubRepository: gitHubRepository)
        setBodyUI(gitHubRepository: gitHubRepository)
    }
    private func setHeaderUI(gitHubRepository: GitHubRepository) {
        avatarImageView.getImage(imageUrlString: gitHubRepository.owner?.avatarImage ?? "")
        titleLabel.text = gitHubRepository.fullName
        descriptionLabel.text = gitHubRepository.description
        if let homePageUrl = gitHubRepository.homePage {
            if homePageUrl.isEmpty {
                homePageButton.setTitle("-", for: .normal)
                homePageButton.isEnabled = false
            } else {
                homePageButton.setTitle(homePageUrl, for: .normal)
            }
        } else {
            homePageButton.setTitle("-", for: .normal)
            homePageButton.isEnabled = false
        }
        languageLabel.text = gitHubRepository.language
        setLanguageIconColor(language: gitHubRepository.language)
    }
    private func setBodyUI(gitHubRepository: GitHubRepository) {
        let defauletNumber = 0
        for information in RepositoryDetail.informations {
            switch information {
            case .license:
                repositoryInformationLabels[information.rawValue].text = information.text(gitHubRepository: gitHubRepository).name
            default:
                repositoryInformationLabels[information.rawValue].text = TextHelper.shared.formatToCSV(value: information.text(gitHubRepository: gitHubRepository).number[information.rawValue] ?? defauletNumber)
            }
        }
    }
    private func setLanguageIconColor(language: String?) {
        guard let language = language else { return }
        languageIconView.backgroundColor = LanguageIcon(language: language).color
    }
    func setReadmeWebView(urlString: String) {
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}
