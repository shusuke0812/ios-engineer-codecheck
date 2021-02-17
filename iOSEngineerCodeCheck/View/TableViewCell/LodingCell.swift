//
//  LodingCell.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/15.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class LodingCell: UITableViewCell {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: - Animation Method
extension LodingCell {
    func startAnimation() {
        self.activityIndicatorView.startAnimating()
    }
}
