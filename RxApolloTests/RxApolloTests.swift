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

    let disposeBag = DisposeBag()

    // MARK: - Query
    
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

        let client = ApolloClient(networkTransport: networkTransport, store: store(initialRecords: nil))
        let result = try client.rx.query(query: query).toBlocking().single()

        XCTAssertEqual(result?.hero?.name, "Luke Skywalker")
    }

    func testUnsuccessfulQuery() throws {
        let query = HeroNameQuery()

        let networkTransport = MockNetworkTransport(body: [
            "data": [
                "hero": [
                    "__typename": "Human"
                ]
            ]
        ])

        let client = ApolloClient(networkTransport: networkTransport, store: store(initialRecords: nil))

        do {
            _ = try client.rx.query(query: query).toBlocking().single()
        } catch _ as GraphQLResultError {
            return
        } catch {
            // Shouldn't get here
            XCTFail()
        }

        // Shouldn't get here
        XCTFail()
    }

    // MARK: - Watch

    func testWatchedQueryGetsUpdatedWithResultFromOtherQuery() throws {
        let testStore = store(initialRecords: [
            "QUERY_ROOT": ["hero": Reference(key: "QUERY_ROOT.hero")],
            "QUERY_ROOT.hero": [
                "name": "R2-D2",
                "__typename": "Droid",
                "friends": [
                    Reference(key: "QUERY_ROOT.hero.friends.0"),
                    Reference(key: "QUERY_ROOT.hero.friends.1"),
                    Reference(key: "QUERY_ROOT.hero.friends.2")
                ]
            ],
            "QUERY_ROOT.hero.friends.0": ["__typename": "Human", "name": "Luke Skywalker"],
            "QUERY_ROOT.hero.friends.1": ["__typename": "Human", "name": "Han Solo"],
            "QUERY_ROOT.hero.friends.2": ["__typename": "Human", "name": "Leia Organa"],
        ])



        let networkTransport = MockNetworkTransport(body: [
            "data": [
                "hero": [
                    "name": "Artoo",
                    "__typename": "Droid"
                ]
            ]
        ])

        let client = ApolloClient(networkTransport: networkTransport, store: testStore)
        let watched = client.rx.watch(query: HeroAndFriendsNamesQuery()).replayAll()

        _ = watched.connect()

        delay(dueTime: 0.1) {
            client.fetch(query: HeroNameQuery(), cachePolicy: .fetchIgnoringCacheData)
        }

        let results = try watched.take(2).timeout(5, scheduler: MainScheduler.instance).toBlocking().toArray()

        let expectedFriendsNames = ["Luke Skywalker", "Han Solo", "Leia Organa"]

        let firstHeroName = results[0].hero?.name
        let firstFriendsNames = results[0].hero?.friends?.map { $0?.name }.flatMap { $0 } ?? []

        XCTAssertEqual(firstHeroName, "R2-D2")
        XCTAssertEqual(firstFriendsNames, expectedFriendsNames)

        let secondHeroName = results[1].hero?.name
        let secondFriendsNames = results[1].hero?.friends?.map { $0?.name }.flatMap { $0 } ?? []

        XCTAssertEqual(secondHeroName, "Artoo")
        XCTAssertEqual(secondFriendsNames, expectedFriendsNames)
    }

    // MARK: - Helpers

    private func store(initialRecords: RecordSet?) -> ApolloStore {
        var cache: InMemoryNormalizedCache

        if let initialRecords = initialRecords {
            cache = InMemoryNormalizedCache(records: initialRecords)
        } else {
            cache = InMemoryNormalizedCache()
        }

        return ApolloStore(cache: cache)
    }

    private func delay(dueTime: RxTimeInterval, closure: @escaping (Void) -> Void) {
        Observable<Void>.empty().delay(dueTime, scheduler: MainScheduler.instance)
            .subscribe(onCompleted: closure)
            .disposed(by: disposeBag)
    }
}
