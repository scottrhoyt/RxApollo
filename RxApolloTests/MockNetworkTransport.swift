//
//  MockNetworkTransport.swift
//  RxApollo
//
//  Created by Scott Hoyt on 5/9/17.
//  Copyright © 2017 Scott Hoyt. All rights reserved.
//

import Foundation
import Apollo

final class MockNetworkTransport: NetworkTransport {
    let body: JSONObject

    public init(body: JSONObject) {
        self.body = body
    }

    public func send<Operation>(
        operation: Operation,
        completionHandler: @escaping (GraphQLResponse<Operation>?, Error?) -> Void) -> Cancellable {
        DispatchQueue.global(qos: .default).async {
            completionHandler(GraphQLResponse(operation: operation, body: self.body), nil)
        }
        return MockTask()
    }
}

private final class MockTask: Cancellable {
    func cancel() {
    }
}
