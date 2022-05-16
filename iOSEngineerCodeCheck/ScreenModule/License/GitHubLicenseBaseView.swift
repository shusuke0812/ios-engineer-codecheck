//
//  GitHubLicenseBaseView.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/28.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class GitHubLicenseBaseView: UIView {
    @IBOutlet weak var licenseLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Initialized Method
extension GitHubLicenseBaseView {
    private func initUI() {
        self.licenseLabel.text = ""
    }
}
// MARK: - Setting UI Method
extension GitHubLicenseBaseView {
    func setUI(gitHubLicenseText: String) {
        self.licenseLabel.text = gitHubLicenseText
    }
}
