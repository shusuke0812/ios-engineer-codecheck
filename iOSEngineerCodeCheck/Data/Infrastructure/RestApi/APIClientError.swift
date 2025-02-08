//
//  GitHubClientError.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2021/2/9.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

/// APIクライアント内のエラー
enum APIClientError: Error {
    /// 通信に失敗（ex. 端末オフライン、URLホストが見つからない etc）
    case connectionError(Error)
    /// 不正なリクエスト内容
    case invalidRequest(json: Any?, statusCode: Int)
    /// レスポンスの変換に失敗（ex. レスポンスのJSON形式とResonse型がアンマッチ、JSONデータが一部欠けていた etc）
    case responseParseError(Error)
    /// APIからのエラーレスポンス（サーバーエラー：400~500番台）
    case apiError(json: Any?, statusCode: Int)
    /// 不明なエラー
    case unknown

    var description: String {
        switch self {
        case .connectionError:      return "通信に失敗"
        case .invalidRequest:       return "不正なリクエスト"
        case .responseParseError:   return "レスポンスの変換に失敗"
        case .apiError:             return "サーバーエラー"
        case .unknown:              return "不明なエラー"
        }
    }
}
