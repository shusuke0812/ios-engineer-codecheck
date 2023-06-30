//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Foundation

struct GitHubRepository: Codable {
    let name: String?
    let fullName: String? // オーナー名+リポジトリ名
    let language: String?
    let starNumber: Int?
    let watchNumber: Int?
    let forkNumber: Int?
    let isueNumber: Int?
    let description: String?
    let homePage: String?
    let updatedAt: Date? // JSONの日付型がSwiftのJSONDecoderに対応していないのでDateFormatterを拡張している）
    let owner: Owner?
    let license: License?

    enum CodingKeys: String, CodingKey {
        case name
        case fullName       = "full_name"
        case language
        case starNumber     = "stargazers_count"
        case watchNumber    = "watchers_count"
        case forkNumber     = "forks_count"
        case isueNumber     = "open_issues_count"
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
    let name: String?
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
    let key: String?
    let name: String?
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
