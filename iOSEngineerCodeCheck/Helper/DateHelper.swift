//
//  DateHelper.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/25.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

class DateHelper {
    private let formatter: DateFormatter

    static let shared = DateHelper()

    private init() {
        self.formatter = DateFormatter()
        self.formatter.locale = Locale(identifier: "ja_JP")
    }
}
extension DateHelper {
    /// Date型を指定したフォーマットに変換する
    /// - Parameter date: 日付
    internal func formatToString(date: Date?) -> String {
        guard let date = date else { return "" }
        self.formatter.dateFormat = "yyyy/MM/dd"
        return self.formatter.string(from: date)
    }
}
