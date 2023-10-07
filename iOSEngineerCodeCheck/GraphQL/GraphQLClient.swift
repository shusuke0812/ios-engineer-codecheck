//
//  GraphQLClient.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation
import Apollo

protocol GraphQLClientProtocol {
    func sendRequest<T: GraphQLRequestProtocol>(_ request: T, cachePolicy: CachePolicy = .returnCacheDataElseFetch, completion: @escaping (T.Query.Data))
}

class GraphQLClient: GraphQLClientProtocol {
    static let shared = GraphQLClient()
    private var apolloClient: ApolloClient?
    private init() {}
}

extension GraphQLClient {
    func sendRequest<T: GraphQLRequestProtocol>(_ request: T, cachePolicy: CachePolicy = .returnCacheDataElseFetch, completion: @escaping (T.Query.Data)) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = request.httpAdditionalHeaders
        
        let session = URLSession(configuration: configuration)
        let httpNetworkTransport = HTTPNetworkTransport(url: request.url, session: session)
        
        apolloClient = ApolloClient(networkTransport: httpNetworkTransport)
        apolloClient?.fetch(query: request.query, cachePolicy: cachePolicy) { result in
            completion(result)
        }
    }
}
