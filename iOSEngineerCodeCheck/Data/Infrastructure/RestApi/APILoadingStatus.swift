//
//  APILoadingStatus.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/1/26.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation

enum APILoadingStatus {
    case initial    // 初回
    case fetching   // 読み込み中
    case full       // 終わり
}
