//
//  GraphQLClient.swift
//  iOSEngineerCodeCheck
//
//  Created by Shusuke Ota on 2023/10/7.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import Foundation
import Apollo
import GitHubGraphQL

protocol GraphQLClientProtocol {
    func sendRequest<T: GraphQLRequestProtocol>(_ request: T, cachePolicy: CachePolicy, completion: @escaping ((Result<GraphQLResult<T.Query.Data>, Error>) -> Void))
}

class GraphQLClient: GraphQLClientProtocol {
    static let shared = GraphQLClient()
    private var apolloClient: ApolloClient?
    private init() {}
}

extension GraphQLClient {
    func sendRequest<T: GraphQLRequestProtocol>(_ request: T, cachePolicy: CachePolicy = .returnCacheDataElseFetch, completion: @escaping ((Result<GraphQLResult<T.Query.Data>, Error>) -> Void)) {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = request.httpAdditionalHeaders
        
        let sessionClient = URLSessionClient(sessionConfiguration: configuration)
        let provider = DefaultInterceptorProvider(client: sessionClient, store: store)
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: request.url)
        
        apolloClient = ApolloClient(networkTransport: requestChainTransport, store: store)
        apolloClient?.fetch(query: request.query, cachePolicy: cachePolicy) { result in
            completion(result)
        }
    }
}
