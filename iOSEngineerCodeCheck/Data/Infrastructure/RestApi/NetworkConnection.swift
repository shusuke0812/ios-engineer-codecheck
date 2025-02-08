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
    private var completionHandler: Completion?
    private var errorHandler: ErrorCompletion?

    private var retriesLeft: Int = 0

    init(request: URLRequest, session: URLSession = URLSession.shared) {
        self.request = request
        self.session = session
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
    func retry(_ count: Int) -> Self {
        retriesLeft = count
        return self
    }

    @discardableResult
    func resume() -> Self {
        recursiveResume(retriesLeft: retriesLeft)
        return self
    }

    private func recursiveResume(retriesLeft: Int) {
        let dataTask = session.dataTask(with: request) { data, response, error in
            self.taskHandler(retriesLeft: retriesLeft, data: data, response: response, error: error)
        }
        dataTask.resume()
    }

    private func taskHandler(retriesLeft: Int, data: Data?, response: URLResponse?, error: Error?) {
        do {
            let responseData = try APIResponse(data: data, response: response as? HTTPURLResponse, error: error).validate() as? Data
            completionHandler?(responseData, response)
        } catch APIClientError.connectionError, APIClientError.unknown, APIClientError.apiError {
            if retriesLeft > 0 {
                recursiveResume(retriesLeft: retriesLeft - 1)
                return
            }
            errorHandler?(error, response)
        } catch APIClientError.invalidRequest {
            errorHandler?(error, response)
        } catch {
            errorHandler?(error, response)
        }
    }
}
