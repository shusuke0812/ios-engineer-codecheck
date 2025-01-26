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
    
    var isOnline: Bool {
        monitor.currentPath.status == .satisfied
    }
    
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    func setup() {
        monitor.start(queue: .global(qos: .background))
    }
}
