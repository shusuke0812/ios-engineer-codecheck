//
//  UIViewController+Extension.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/12/4.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

extension UIViewController {
    /// キーボード以外の画面をタップした時にキーボードを閉じる処理
    internal func setDissmissKeyboard() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc private func dissmissKeyboard() {
        self.view.endEditing(true)
    }
}
