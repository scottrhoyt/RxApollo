//
//  RxApolloTests.swift
//  RxApolloTests
//
//  Created by Scott Hoyt on 5/9/17.
//  Copyright © 2017 Scott Hoyt. All rights reserved.
//

import XCTest
import Apollo
import RxSwift
import RxApollo
import RxBlocking

class RxApolloTests: XCTestCase {
    
    func testSuccessfulQuery() throws {
        let query = HeroNameQuery()

        let networkTransport = MockNetworkTransport(body: [
            "data": [
                "hero": [
                    "name": "Luke Skywalker",
                    "__typename": "Human"
                ]
            ]
        ])

        let client = ApolloClient(networkTransport: networkTransport)
        let result = try client.rx.query(query: query).toBlocking().single()

        XCTAssertEqual(result?.hero?.name, "Luke Skywalker")
    }
}
