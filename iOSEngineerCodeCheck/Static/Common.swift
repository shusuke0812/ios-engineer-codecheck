//
//  Common.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import FontAwesome_swift

/// モジュール内共通のデータ
struct Common {
}

/// HTTPメソッド
enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

/// APIの読み込み状況
enum APILoadingStatus {
    case initial    // 初回
    case fetching   // 読み込み中
    case full       // 終わり
}

/// リポジトリ詳細
enum RepositoryDetail: Int {
    case star       = 0
    case watch      = 1
    case fork       = 2
    case issue      = 3
    case license    = 4
}
extension RepositoryDetail {
    /// リポジトリ詳細画面のボディー部で使うアイコンとラベルの識別子
    static var informations: [RepositoryDetail] {
        [.star, .watch, .fork, .issue, .license]
    }
    /// アイコン色
    var iconColor: UIColor {
        switch self {
        case .star:     return .systemBlue
        case .watch:    return .systemYellow
        case .fork:     return .systemGreen
        case .issue:    return .systemOrange
        case .license:  return .systemRed
        }
    }
    /// アイコンイメージ
    var iconImage: UIImage {
        let iconSize = CGSize(width: 25, height: 25)
        switch self {
        case .star:     return UIImage.fontAwesomeIcon(name: .star, style: .solid, textColor: .white, size: iconSize)
        case .watch:    return UIImage.fontAwesomeIcon(name: .eye, style: .solid, textColor: .white, size: iconSize)
        case .fork:     return UIImage.fontAwesomeIcon(name: .codeBranch, style: .solid, textColor: .white, size: iconSize)
        case .issue:    return UIImage.fontAwesomeIcon(name: .infoCircle, style: .solid, textColor: .white, size: iconSize)
        case .license:  return UIImage.fontAwesomeIcon(name: .balanceScale, style: .solid, textColor: .white, size: iconSize)
        }
    }
    /// テキスト情報
    func text(gitHubRepository: GitHubRepository.Item) -> (number: [Int?], name: String?) {
        ([gitHubRepository.starNumber, gitHubRepository.watchNumber, gitHubRepository.forkNumber, gitHubRepository.isueNumber], gitHubRepository.license?.name)
    }
}

/// 言語カラー
enum LanguageIcon {
    case swift      // 薄いオレンジ色 #ffac45
    case cpp        // 濃いピンク色 #f34b7d
    case cn         // 灰色 #555555
    case cs         // 緑色 #178600
    case objectiveC // スカイブルー #438eff
    case javaSctipt // 黄色 #f1e05a
    case typeScript // 青緑色 #2b7489
    case css        // 紫色 #563d7c
    case html       // 薄い赤色 #e34c26
    case java       // 茶色 #b07219
    case kotlin     // 濃いオレンジ色 #F18E33
    case python     // 薄い青緑色 #3572A5
    case ruby       // 紅色 #701516
    case go         // #00ADD8
    case php        // #384d54
    case shell      // 薄い緑色 #89e051
    case other
    // swiftlint:disable cyclomatic_complexity
    init(language: String) {
        switch language {
        case "Swift":       self = .swift
        case "C++":         self = .cpp
        case "C":           self = .cn
        case "C#":          self = .cs
        case "Objective-C": self = .objectiveC
        case "JavaScript":  self = .javaSctipt
        case "TypeScript":  self = .typeScript
        case "CSS":         self = .css
        case "HTML":        self = .html
        case "Java":        self = .java
        case "Kotlin":      self = .kotlin
        case "Python":      self = .python
        case "Ruby":        self = .ruby
        case "Go":          self = .go
        case "PHP":         self = .php
        case "Shell":       self = .shell
        default:            self = .other
        }
    }
    // swiftlint:enable cyclomatic_complexity
    /// 言語毎のHEXカラー（色はGitHubのWebページ参考）
    var color: UIColor {
        switch self {
        case .swift:        return UIColor(hex: "ffac45")
        case .cpp:          return UIColor(hex: "f34b7d")
        case .cn:           return UIColor(hex: "555555")
        case .cs:           return UIColor(hex: "178600")
        case .objectiveC:   return UIColor(hex: "438eff")
        case .javaSctipt:   return UIColor(hex: "f1e05a")
        case .typeScript:   return UIColor(hex: "2b7489")
        case .css:          return UIColor(hex: "563d7c")
        case .html:         return UIColor(hex: "e34c26")
        case .java:         return UIColor(hex: "b07219")
        case .kotlin:       return UIColor(hex: "f18e33")
        case .python:       return UIColor(hex: "3572a5")
        case .ruby:         return UIColor(hex: "701516")
        case .go:           return UIColor(hex: "00add8")
        case .php:          return UIColor(hex: "384d54")
        case .shell:        return UIColor(hex: "89e051")
        case .other:        return UIColor(hex: "586069")
        }
    }
}
