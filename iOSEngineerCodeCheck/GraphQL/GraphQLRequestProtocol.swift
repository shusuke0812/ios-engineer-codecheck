//
//  GraphQLRequest.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation
import Apollo
import GitHubGrapQL

protocol GraphQLRequestProtocol {
    associatedtype Query: GraphQLQuery
    
    var query: Query { get }
    var url: URL { get }
    var httpAdditionalHeaders: [AnyHashable: Any]? { get }
}

extension GraphQLRequestProtocol {
    var httpAdditionalHeaders: [AnyHashable: Any]? {
        [:]
    }
}
