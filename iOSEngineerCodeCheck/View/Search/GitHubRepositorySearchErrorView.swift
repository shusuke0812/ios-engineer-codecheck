//
//  GitHubRepositorySearchErrorView.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/1/26.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import UIKit

protocol GitHubRepositorySearchErrorViewDelegate: AnyObject {
    func didTapRetryButton(_ view: GitHubRepositorySearchErrorView)
}

class GitHubRepositorySearchErrorView: UIView {
    private var descriptionLabel = UILabel()
    private var retryButton = UIButton()

    private let buttonHeight: CGFloat = 44

    weak var delegate: GitHubRepositorySearchErrorViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupComponent()
        setupAction()
    }

    func updateErrorState(_ error: GitHubSearchErrorState) {
        descriptionLabel.text = error.description
        retryButton.isHidden = error.retryButtonIsHidden
    }

    private func setupComponent() {
        backgroundColor = .white

        descriptionLabel.text = ""
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .bold)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        retryButton.setTitle("もう一度試す", for: .normal)
        retryButton.setTitleColor(.lightGray, for: .normal)
        retryButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        retryButton.layer.borderColor = UIColor.lightGray.cgColor
        retryButton.layer.borderWidth = 1.0
        retryButton.layer.cornerRadius = buttonHeight / 2
        retryButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(descriptionLabel)
        addSubview(retryButton)

        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            retryButton.widthAnchor.constraint(equalToConstant: buttonHeight * 3),
            retryButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            retryButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40)
        ])
    }

    private func setupAction() {
        retryButton.addAction(.init { [weak self] _ in
            guard let self else {
                return
            }
            self.delegate?.didTapRetryButton(self)
        }, for: .touchUpInside)
    }
}
