//
//  NetworkConnection.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/2/7.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation

final class NetworkConnection {
    typealias Completion = (Data?, URLResponse?) -> Void
    typealias ErrorCompletion = (Error?, URLResponse?) -> Void

    private let session: URLSession
    private let request: URLRequest
    private var dataTask: URLSessionDataTask?
    private var completionHandler: Completion?
    private var errorHandler: ErrorCompletion?

    init(session: URLSession = URLSession.shared, request: URLRequest) {
        self.session = session
        self.request = request
    }

    @discardableResult
    func completion(_ handler: @escaping Completion) -> Self {
        completionHandler = handler
        return self
    }

    @discardableResult
    func error(_ handler: @escaping ErrorCompletion) -> Self {
        errorHandler = handler
        return self
    }

    @discardableResult
    func resume() -> Self {
        dataTask = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            self?.taskHandler(data: data, response: response, error: error)
        })
        dataTask?.resume()
        return self
    }

    private func taskHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            errorHandler?(error, response)
            return
        }
        completionHandler?(data, response)
    }
}
