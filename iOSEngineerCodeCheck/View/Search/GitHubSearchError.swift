//
//  GitHubSearchError.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/2/2.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation

enum GitHubSearchError {
    case ready
    case noRepositories
    case noNetwork

    var description: String {
        switch self {
        case  .ready:
            return ""
        case .noRepositories:
            return "リポジトリーがないよー"
        case .noNetwork:
            return "ネットワークに接続されていません"
        }
    }

    var retryButtonIsHidden: Bool {
        switch self {
        case .ready:
            return true
        case .noRepositories:
            return true
        case .noNetwork:
            return false
        }
    }
}
