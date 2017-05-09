//
//  RxApolloTests.swift
//  RxApolloTests
//
//  Created by Scott Hoyt on 5/9/17.
//  Copyright © 2017 Scott Hoyt. All rights reserved.
//

import XCTest

class RxApolloTests: XCTestCase {
    
    func testFetchIgnoringCacheData() throws {
        let query = HeroNameQuery()

        let store = ApolloStore(records: [
            "QUERY_ROOT": ["hero": Reference(key: "hero")],
            "hero": [
                "name": "R2-D2",
                "__typename": "Droid",
            ]
            ])

        let networkTransport = MockNetworkTransport(body: [
            "data": [
                "hero": [
                    "name": "Luke Skywalker",
                    "__typename": "Human"
                ]
            ]
            ])

        let client = ApolloClient(networkTransport: networkTransport, store: store)

        let expectation = self.expectation(description: "Fetching query")

        client.fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { (result, error) in
            defer { expectation.fulfill() }

            guard let result = result else { XCTFail("No query result");  return }
            
            XCTAssertEqual(result.data?.hero?.name, "Luke Skywalker")
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}
