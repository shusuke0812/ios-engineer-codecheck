//
//  UIColor+Extension.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/25.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

extension UIColor {
    /// HEX（16進数）で色を設定する
    /// - Parameters:
    ///   - hex: 色コード（例：#F18E33）
    ///   - alpha: 透明度（何も指定しないとデフォルトの1.0となる）
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let value = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(value / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(value / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(value / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
