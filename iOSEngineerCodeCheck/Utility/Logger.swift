//
//  Logger.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/2/1.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation

let kLogger = Logger()

class Logger {
    private let dateFormatter: DateFormatter
    private var timeStamp: String {
        dateFormatter.string(from: Date())
    }

    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        dateFormatter.locale = Locale(identifier: "ja_JP")
    }

    func debugPrint(filePath: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        basePrint(filePath: filePath, function: function, line: line, message)
    }

    private func basePrint(filePath: String, function: String, line: Int, _ message: String) {
        #if DEBUG
        print("debug: \(className(from: filePath)) \(function) \(line) \(message)")
        #endif
    }

    private func className(from filepath: String) -> String {
        let fileName = filepath.components(separatedBy: "/").last
        return fileName?.components(separatedBy: ".").first ?? ""
    }
}
