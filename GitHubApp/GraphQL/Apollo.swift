//
//  Apollo.swift
//  GitHubApp
//
//  Created by Jouni Rantanen on 5/26/21.
//

import Foundation
import Apollo
import ApolloAPI // For GraphQLNullable

class Network {
    
    static let shared = Network()
    private init() { }
    
    private(set) lazy var apollo: ApolloClient = { () -> ApolloClient in
        
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        
        // Attempt to read the token from an environment variable
        guard let token = ProcessInfo.processInfo.environment["GITHUB_ACCESS_TOKEN"] else {
            fatalError("Error: GITHUB_ACCESS_TOKEN environment variable not set. Please set it in your Xcode scheme.")
        }
        
        let provider = DefaultInterceptorProvider(client: client, shouldInvalidateClientOnDeinit: true, store: store)
        let url = URL(string: "https://api.github.com/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url, additionalHeaders: ["Authorization": "Bearer \(token)"])
        
        return ApolloClient(networkTransport: requestChainTransport, store: store)
        
    }()
    
}
