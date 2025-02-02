//
//  NetworkConnectivityHelper.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2025/1/26.
//  Copyright © 2025 YUMEMI Inc. All rights reserved.
//

import Foundation
import Network

final class NetworkConnectivity {
    static let shared = NetworkConnectivity()

    private let monitor: NWPathMonitor
    private var isFirstSetup = true

    var isOnline: Bool {
        monitor.currentPath.status == .satisfied
    }

    private init() {
        monitor = NWPathMonitor()
    }

    deinit {
        monitor.cancel()
    }

    func setup() {
        kLogger.debugPrint()

        let semaphore = DispatchSemaphore(value: 0)
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self else {
                return
            }
            if self.isFirstSetup {
                kLogger.debugPrint("update network status=\(path.status)")
                self.isFirstSetup = false
                semaphore.signal()
            }
        }
        monitor.start(queue: .global())
        switch semaphore.wait(timeout: .now() + 1) {
        case .success:
            kLogger.debugPrint("success")
        case .timedOut:
            isFirstSetup = false
        }
    }
}
