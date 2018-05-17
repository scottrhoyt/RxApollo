## Master

##### Breaking

* Apollo-ios 0.8

##### Enhancements

* None

##### Bug Fixes

* None

##### Breaking

* Change `ApolloReactiveExtensions` to a `class` to reflect the identity
  relationship between `ApolloReactiveExtensions` and `ApolloClient`.

##### Enhancements

* None

##### Bug Fixes

* None

## 0.6.0

##### Breaking

* Apollo-ios 0.7

##### Enhancements

* None

##### Bug Fixes

* None

## 0.5.0

##### Breaking

* Swift 4
* RxSwift 4.0

##### Enhancements

* None

##### Bug Fixes

* None

## 0.4.1

##### Breaking

* None

##### Enhancements

* Add Cocoapods support.

##### Bug Fixes

* None

## 0.4.0

##### Breaking

* None

##### Enhancements

* Upate Apollo to 0.6

##### Bug Fixes

* None

## 0.3.0

##### Breaking

* Rename `ApolloClient.rx.query` to `ApolloClient.rx.fetch`

##### Enhancements

* Add documentation comments.
* Improve test coverage.
* Add SwiftLint

##### Bug Fixes

* None

## 0.2.1

##### Breaking

* None

##### Enhancements

* None

##### Bug Fixes

* Fix tests on CI.

## 0.2.0

##### Breaking

* `query` and `perform` are now `Maybe`s to reflect that they might not return data (e.g. depending on the cache policy).
* `RxApolloError` no longer has a `noData` case.
* `watch` no does not emit an event when neither data or an error were passed to the respective callback.

##### Enhancements

* Added some test coverage.

##### Bug Fixes

* None

## 0.1.0

##### Breaking

* None

##### Enhancements

* Initial Release

##### Bug Fixes

* None
