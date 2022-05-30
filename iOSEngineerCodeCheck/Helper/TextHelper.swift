//
//  TextHelper.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/25.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

class TextHelper {
    private let formatter: NumberFormatter

    static let shared = TextHelper()

    private init() {
        self.formatter = NumberFormatter()
    }
}
extension TextHelper {
    /// 数値をカンマで区切って文字列に変換する
    /// - Parameter value: 数値
    func formatToCSV(value: Int) -> String {
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
