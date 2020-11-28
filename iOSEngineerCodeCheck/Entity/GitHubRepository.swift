//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

/// GitHubRepositoryのデータ格納
struct GitHubRepository: Codable {
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
    /// オーナー情報
    let owner: GitHubRepositoryOwner?
    
    enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case language = "language"
        case starNumber = "stargazers_count"
        case watchNumber = "watchers_count"
        case forkNumber = "forks_count"
        case isueNumber = "open_issues_ccount"
        case owner
    }
    
    init(name: String, language: String,
         starNumber: Int, watchNumber: Int, forkNumber: Int, isueNumber: Int,
         owner: GitHubRepositoryOwner) {
        self.name = name
        self.language = language
        self.starNumber = starNumber
        self.watchNumber = watchNumber
        self.forkNumber = forkNumber
        self.isueNumber = isueNumber
        self.owner = owner
    }
}
/// GitHubRepositoryのOwnerデータ格納
struct GitHubRepositoryOwner: Codable {
    /// アバター画像URL
    let avaterImage: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarImage = "avatar_url"
    }
    
    init(avaterImage: String) {
        self.avaterImage = avaterImage
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.avaterImage = try values.decode(String.self, forKey: .avatarImage)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(avaterImage, forKey: .avatarImage)
    }
}
