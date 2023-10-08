//
//  JsonFileReadHelper.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

enum JsonFileReadHelper {
    static func load<T: Codable>(_ fileName: String) -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("debug: Can not find JSON file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("debug: Failed to locad JSON file")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("debug: Failed to decode JSON file")
        }
        return loaded
    }

    static func getGitHubAccessToken() -> String {
        let githubAccessToken: GitHubAccessToken = JsonFileReadHelper.load("github-access-token")
        return githubAccessToken.key
    }
}

struct GitHubAccessToken: Codable {
    let key: String

    enum CodingKeys: String, CodingKey {
        case key
    }
}
