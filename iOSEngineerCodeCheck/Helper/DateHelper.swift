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
    func formatToString(date: Date?) -> String {
        guard let date = date else { return "" }
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: date)
    }
}
