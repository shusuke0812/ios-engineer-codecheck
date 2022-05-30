//
//  Items.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/4/7.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

/**
 * Search repositories / Search users / Search issues and pull requests 等に共通する構造体
 * それぞれのデータ構造はItemに型引数として入れて使用する
 * ドキュメント：https://docs.github.com/ja/rest/reference/search#search-repositories
 */

import Foundation

struct Items<Item: Codable>: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount         = "total_count"
        case incompleteResults  = "incomplete_results"
        case items
    }
}
