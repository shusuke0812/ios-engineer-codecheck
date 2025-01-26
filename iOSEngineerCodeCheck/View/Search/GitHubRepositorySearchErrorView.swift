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
    private var descriptionLabel: UILabel = UILabel()
    private var retryButton: UIButton = UIButton()
    
    weak var delegate: GitHubRepositorySearchErrorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDescription(text: String) {
        descriptionLabel.text = text
    }
    
    private func setupComponent() {
        backgroundColor = .white
      
        descriptionLabel.text = ""
        descriptionLabel.tintColor = .init(hex: "4D5156")
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .bold)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        retryButton.setTitle("もう一度試す", for: .normal)
        retryButton.setTitleColor(.lightGray, for: .normal)
        retryButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        retryButton.layer.borderWidth = 0.5
        retryButton.layer.cornerRadius = 8
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(descriptionLabel)
        addSubview(retryButton)
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            retryButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
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
