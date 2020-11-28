//
//  Common.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2020/11/28.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Foundation

/// モジュール内共通のデータ
struct Common {
    /// API URLのプレフィックス
    struct ApiUrl {
        /// GET /search/repositories
        internal static let gitHubSearchApi = "https://api.github.com/search/repositories"
    }
}
/// ネットワークエラー
enum NetworkError: Error {
    case invalidUrl         // 不正なURL
    case invalidResponse    // 不正なレスポンス
    case unknown            // 想定外エラー
    func description() -> String {
        switch self {
            case .invalidUrl:       return "DEBUG： 不正なURLです"
            case .invalidResponse:  return "DEBUG： 不正なレスポンスです"
            case .unknown:          return "DEBUG： レスポンスに失敗しました"
        }
    }
}
/// クライアントエラー
enum ClientError: Error {
    case parseField // パースエラー
    case unknown    // 想定外エラー
}
