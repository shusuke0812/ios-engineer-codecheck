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
    /// リポジトリデータ集
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }

    struct Item: Codable {
        /// リポジトリ名
        let name: String?
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

        enum CodingKeys: String, CodingKey {
            case name           = "full_name"
            case language       = "language"
            case starNumber     = "stargazers_count"
            case watchNumber    = "watchers_count"
            case forkNumber     = "forks_count"
            case isueNumber     = "open_issues_ccount"
            case description    = "description"
            case homePage       = "homepage"
            case updatedAt      = "updated_at"
            case owner
        }
        init(name: String, language: String, starNumber: Int, watchNumber: Int, forkNumber: Int, isueNumber: Int, description: String, homePage: String, updatedAt: Date, owner: Owner) {
            self.name = name
            self.language = language
            self.starNumber = starNumber
            self.watchNumber = watchNumber
            self.forkNumber = forkNumber
            self.isueNumber = isueNumber
            self.description = description
            self.homePage = homePage
            self.updatedAt = updatedAt
            self.owner = owner
        }
    }

    struct Owner: Codable {
        /// アバター画像URL
        let avatarImage: String?

        enum CodingKeys: String, CodingKey {
            case avatarImage = "avatar_url"
        }
        init(avatarImage: String) {
            self.avatarImage = avatarImage
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.avatarImage = try values.decode(String.self, forKey: .avatarImage)
        }
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(avatarImage, forKey: .avatarImage)
        }
    }
}
