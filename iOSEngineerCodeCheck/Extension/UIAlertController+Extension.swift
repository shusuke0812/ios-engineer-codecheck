//
//  UIAlertController+Extension.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/30.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

extension UIAlertController {
    /// アラート表示
    /// - Parameters:
    ///   - style: アラート種類
    ///   - viewController: アラートを表示させるViewController
    ///   - title: タイトル
    ///   - message: サブタイトル
    ///   - okButtonTitle: OKボタンのタイトル
    ///   - cancelButtonTitle: キャンセルボタンタイトル
    internal static func showAlert(style: UIAlertController.Style, viewController: UIViewController, title: String?, message: String?, okButtonTitle: String?, cancelButtonTitle: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default) { _ in
            print("DEBUG: OKボタンが押されました")
        }
        alert.addAction(okAction)
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
                print("DEEBUG: キャンセルボタンが押されました")
            }
            alert.addAction(cancelAction)
        }
        viewController.present(alert, animated: true, completion: nil)
    }
}
