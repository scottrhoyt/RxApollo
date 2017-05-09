//
//  RxApollo.swift
//  RxApollo
//
//  Created by Scott Hoyt on 5/9/17.
//  Copyright © 2017 Scott Hoyt. All rights reserved.
//

import Foundation
import RxSwift
import Apollo

enum RxApolloError: Error {
    case graphQLErrors([GraphQLError])
    case noData
}

struct ApolloReactiveExtensions {
    let client: ApolloClient

    init(_ client: ApolloClient) {
        self.client = client
    }

    func query<Query: GraphQLQuery>(query: Query, cachePolicy: CachePolicy = .returnCacheDataElseFetch, queue: DispatchQueue = DispatchQueue.main) -> Single<Query.Data> {
        return Single.create { single in
            let cancellable = self.client.fetch(query: query, cachePolicy: cachePolicy, queue: queue) { result, error in
                if let error = error {
                    single(.error(error))
                } else if let errors = result?.errors {
                    single(.error(RxApolloError.graphQLErrors(errors)))
                } else if let data = result?.data {
                    single(.success(data))
                } else {
                    single(.error(RxApolloError.noData))
                }
            }

            return Disposables.create {
                cancellable.cancel()
            }
        }
    }

    func watch<Query: GraphQLQuery>(query: Query, cachePolicy: CachePolicy = .returnCacheDataElseFetch, queue: DispatchQueue = DispatchQueue.main) -> Observable<Query.Data> {
        return Observable.create { observer in
            let watcher = self.client.watch(query: query, cachePolicy: cachePolicy, queue: queue) { result, error in
                if let error = error {
                    observer.onError(error)
                } else if let errors = result?.errors {
                    observer.onError(RxApolloError.graphQLErrors(errors))
                } else if let data = result?.data {
                    observer.onNext(data)
                } else {
                    observer.onError(RxApolloError.noData)
                }
            }

            return Disposables.create {
                watcher.cancel()
            }
        }
    }

    func perform<Mutation: GraphQLMutation>(mutation: Mutation, queue: DispatchQueue = DispatchQueue.main) -> Single<Mutation.Data> {
        return Single.create { single in
            let cancellable = self.client.perform(mutation: mutation, queue: queue) { result, error in
                if let error = error {
                    single(.error(error))
                } else if let errors = result?.errors {
                    single(.error(RxApolloError.graphQLErrors(errors)))
                } else if let data = result?.data {
                    single(.success(data))
                } else {
                    single(.error(RxApolloError.noData))
                }
            }

            return Disposables.create {
                cancellable.cancel()
            }
        }
    }
}

extension ApolloClient {
    var rx: ApolloReactiveExtensions { return ApolloReactiveExtensions(self) }
}

