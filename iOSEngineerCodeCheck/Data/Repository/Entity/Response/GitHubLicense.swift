//
//  GitHubLicense.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/1/27.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

struct GitHubLicense: Codable {
    let description: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case description
        case body
    }
    init(description: String, body: String) {
        self.description = description
        self.body = body
    }
}
