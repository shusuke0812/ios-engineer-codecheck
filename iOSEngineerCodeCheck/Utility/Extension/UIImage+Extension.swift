//
//  UIImage+Extension.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/29.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

extension UIImageView {
    /// 文字列型URLをUIImageに変換するメソッド
    /// - Parameters:
    ///   - imageUrlString: 画像URL
    func getImage(imageUrlString: String) {
        guard let url = URL(string: imageUrlString) else {
            kLogger.debugPrint("画像URLの変換に失敗しました")
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                kLogger.debugPrint("画像の読み込みに失敗しました \(error)")
                return
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        .resume()
    }
}
