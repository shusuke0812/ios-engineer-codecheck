//
//  GitHubAPIError.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/9.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

// GitHubAPI クライアントエラー ドキュメント：https://docs.github.com/ja/rest/overview/resources-in-the-rest-api#client-errors

import Foundation

struct GitHubAPIError: Codable, Error {
    var message: String
    var errors: [Error]
    
    enum CodingKeys: String, CodingKey {
        case message
        case errors
    }
    
    struct Error: Codable {
        var resorce: String
        var field: String
        var missing_field: String
        
        enum CodingKeys: String, CodingKey {
            case resorce
            case field
            case missing_field
        }
    }
}
