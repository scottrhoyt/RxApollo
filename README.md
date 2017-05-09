# RxApollo
[RxSwift](https://github.com/ReactiveX/RxSwift) extensions for [Apollo](https://github.com/apollographql/apollo-ios).

## Installation

### Carthage

```sh
github "scottrhoyt/RxApollo"
```

### Manual

Add `RxApollo.swift` to your project.

## Usage

All the reactive extensions are encapsulated in the `rx` property of an `ApolloClient`.

```swift
import Apollo
import RxSwift
import RxApollo

let apollo: ApolloClient
let disposeBag = DisposeBag()
```

### Query

Querying works just how you would expect it to:

```swift
// Let's get our hero's name and print it or the error if there is one.
apollo.rx.query(query: HeroNameQuery())
  .map { $0.hero?.name }
  .subscribe(onNext: { heroName in
    print("Our hero's name is \(heroName).")
  }, onError: { error in
    print("Received error: \(error).")
  })
  .disposed(by: disposeBag)
```

### Watch

```swift
// Let's watch to see if our hero's name changes and print it or the error if there is one.
apollo.rx.watch(query: HeroNameQuery())
  .map { $0.hero?.name }
  .subscribe(onNext: { heroName in
    print("Our hero's name is \(heroName).")
  }, onError: { error in
    print("Received error: \(error).")
  })
  .disposed(by: disposeBag)
```

Watching works quite well with using `RxCocoa` bindings:

```swift
import RxCocoa

let heroField: UITextField

// Let's watch to see if our hero's name changes and set a text field.
apollo.rx.watch(query: HeroNameQuery())
  .map { $0.hero?.name }
  .asDriver(onErrorJustReturn: nil)
  .drive(heroField.rx.text)
  .disposed(by: disposeBag)
```

### Mutate

Mutations follow the same pattern as well:

```swift
// Let's upvote a post.
apollo.rx.perform(mutation: UpvotePostMutation(postId: postId))
  .subscribe()
  .disposed(by: disposeBag)
```

## License

MIT
