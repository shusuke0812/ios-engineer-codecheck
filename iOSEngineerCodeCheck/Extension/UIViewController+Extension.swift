//
//  UIViewController+Extension.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/12/4.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import SafariServices

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
    /// Safariで指定したURLのページを開く
    /// - Parameter urlString: URL文字列
    internal func transitionSafariViewController(urlString: String) {
        let url: URL?
        // 不正なURLであるかを判定する（不正なものはhttpsスキームをつけてブラウザでエラーハンドリングする）
        if urlString.hasPrefix("http://") || urlString.hasPrefix("https://") {
            url = URL(string: urlString)
        } else {
            url = URL(string: "https://" + urlString)
        }
        // Safariでwebページを開く
        if let url = url {
            let safariVC: SFSafariViewController = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
        }
    }
}
