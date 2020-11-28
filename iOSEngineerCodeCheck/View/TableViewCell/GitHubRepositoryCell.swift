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
        self.initUI()
    }
}
// MARK: - Setting UI Method
extension GitHubRepositoryCell {
    private func initUI() {
        self.title.text = ""
        self.language.text = ""
    }
    func setUI() {
    }
}
