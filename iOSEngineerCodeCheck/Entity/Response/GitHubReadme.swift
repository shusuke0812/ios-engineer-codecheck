//
//  GitHubReadme.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/2.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

struct GitHubReadme: Codable {
    let htmlUrl: String

    enum CodingKeys: String, CodingKey {
        case htmlUrl = "html_url"
    }
    init(htmlUrl: String) {
        self.htmlUrl = htmlUrl
    }
}
