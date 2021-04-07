//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

/// GitHuのリポジトリデータ格納用
struct GitHubRepository: Codable {
    /// リポジトリ名
    let name: String?
    /// オーナー名+リポジトリ名
    let fullName: String?
    /// リポジトリ言語
    let language: String?
    /// スター数
    let starNumber: Int?
    /// ウォッチ数
    let watchNumber: Int?
    /// フォーク数
    let forkNumber: Int?
    /// イシュー数
    let isueNumber: Int?
    /// 説明文
    let description: String?
    /// ホームページ
    let homePage: String?
    /// 更新日（MEMO: JSONの日付型がSwiftのJSONDecoderに対応していないのでDateFormatterを拡張している）
    let updatedAt: Date?
    /// オーナー情報
    let owner: Owner?
    ///　ライセンス情報
    let license: License?

    enum CodingKeys: String, CodingKey {
        case name
        case fullName       = "full_name"
        case language
        case starNumber     = "stargazers_count"
        case watchNumber    = "watchers_count"
        case forkNumber     = "forks_count"
        case isueNumber     = "open_issues_ccount"
        case description
        case homePage       = "homepage"
        case updatedAt      = "updated_at"
        case owner
        case license
    }
    init(name: String, fullName: String, language: String, starNumber: Int, watchNumber: Int, forkNumber: Int, isueNumber: Int, description: String, homePage: String, updatedAt: Date, owner: Owner, license: License) {
        self.name = name
        self.fullName = fullName
        self.language = language
        self.starNumber = starNumber
        self.watchNumber = watchNumber
        self.forkNumber = forkNumber
        self.isueNumber = isueNumber
        self.description = description
        self.homePage = homePage
        self.updatedAt = updatedAt
        self.owner = owner
        self.license = license
    }
}

struct Owner: Codable {
    /// 名前
    let name: String?
    /// アバター画像URL
    let avatarImage: String?

    enum CodingKeys: String, CodingKey {
        case name        = "login"
        case avatarImage = "avatar_url"
    }
    init(name: String, avatarImage: String) {
        self.name = name
        self.avatarImage = avatarImage
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.avatarImage = try values.decode(String.self, forKey: .avatarImage)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avatarImage, forKey: .avatarImage)
    }
}

struct License: Codable {
    /// キー
    let key: String?
    /// 名前
    let name: String?
    /// URL
    let url: String?

    enum CodingKeys: String, CodingKey {
        case key    = "key"
        case name   = "name"
        case url    = "url"
    }
    init(key: String, name: String, url: String) {
        self.key = key
        self.name = name
        self.url = url
    }
}
