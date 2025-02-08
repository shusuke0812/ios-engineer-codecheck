//
//  APIResponse.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/2/8.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation

struct APIResponse {
    let data: Data?
    let response: HTTPURLResponse?
    let error: Error?

    func validate() throws -> Any? {
        if let error = error {
            throw APIClientError.connectionError(error)
        }
        guard let response = response else {
            throw APIClientError.unknown
        }
        if (300...400).contains(response.statusCode) {
            let json = serializeJson(data)
            throw APIClientError.invalidRequest(json: json, statusCode: response.statusCode)
        }
        if (400...500).contains(response.statusCode) {
            let json = serializeJson(data)
            throw APIClientError.apiError(json: json, statusCode: response.statusCode)
        }
        guard let data = data, !data.isEmpty else {
            if response.statusCode == 204 {
                return nil
            }
            throw APIClientError.apiError(json: nil, statusCode: response.statusCode)
        }
        return data
    }

    private func serializeJson(_ data: Data?) -> Any? {
        guard let data = data else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: [])
    }
}
