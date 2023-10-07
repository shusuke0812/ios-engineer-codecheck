//
//  JsonFileReadHelper.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation

struct JsonFileReadHelper {
    static func load<T: Codable>(_ fileName: String) -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            assertionFailure("debug: Can not find JSON file")
        }
        guard let data = try? Data(contentsOf: url) else {
            assertionFailure("debug: Failed to locad JSON file")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            assertionFailure("debug: Failed to decode JSON file")
        }
        return loaded
    }
}

struct GitHubAccessToken {
    let $comment: String
    let key: String
    
    static func load<Self>() -> String {
        let githubAccessToken = JsonFileReadHelper.load("github-access-token")
        return githubAccessToken.key
    }
}
