//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Star Wars Episode IV: A New Hope, released in 1977.
  case newhope
  /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case empire
  /// Star Wars Episode VI: Return of the Jedi, released in 1983.
  case jedi
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NEWHOPE": self = .newhope
      case "EMPIRE": self = .empire
      case "JEDI": self = .jedi
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .newhope: return "NEWHOPE"
      case .empire: return "EMPIRE"
      case .jedi: return "JEDI"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: Episode, rhs: Episode) -> Bool {
    switch (lhs, rhs) {
      case (.newhope, .newhope): return true
      case (.empire, .empire): return true
      case (.jedi, .jedi): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

/// The input object sent when someone is creating a new review
public struct ReviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(stars: Int, commentary: Optional<String?> = nil, favoriteColor: Optional<ColorInput?> = nil) {
    graphQLMap = ["stars": stars, "commentary": commentary, "favoriteColor": favoriteColor]
  }

  /// 0-5 stars
  public var stars: Int {
    get {
      return graphQLMap["stars"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "stars")
    }
  }

  /// Comment about the movie, optional
  public var commentary: Optional<String?> {
    get {
      return graphQLMap["commentary"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "commentary")
    }
  }

  /// Favorite color, optional
  public var favoriteColor: Optional<ColorInput?> {
    get {
      return graphQLMap["favoriteColor"] as! Optional<ColorInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "favoriteColor")
    }
  }
}

/// The input object sent when passing in a color
public struct ColorInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(red: Int, green: Int, blue: Int) {
    graphQLMap = ["red": red, "green": green, "blue": blue]
  }

  public var red: Int {
    get {
      return graphQLMap["red"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "red")
    }
  }

  public var green: Int {
    get {
      return graphQLMap["green"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "green")
    }
  }

  public var blue: Int {
    get {
      return graphQLMap["blue"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "blue")
    }
  }
}

public final class CreateReviewForEpisodeMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateReviewForEpisode($episode: Episode!, $review: ReviewInput!) {\n  createReview(episode: $episode, review: $review) {\n    __typename\n    stars\n    commentary\n  }\n}"

  public var episode: Episode
  public var review: ReviewInput

  public init(episode: Episode, review: ReviewInput) {
    self.episode = episode
    self.review = review
  }

  public var variables: GraphQLMap? {
    return ["episode": episode, "review": review]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReview", arguments: ["episode": GraphQLVariable("episode"), "review": GraphQLVariable("review")], type: .object(CreateReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createReview: CreateReview? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createReview": createReview.flatMap { $0.snapshot }])
    }

    public var createReview: CreateReview? {
      get {
        return (snapshot["createReview"] as? Snapshot).flatMap { CreateReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createReview")
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("stars", type: .nonNull(.scalar(Int.self))),
        GraphQLField("commentary", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(stars: Int, commentary: String? = nil) {
        self.init(snapshot: ["__typename": "Review", "stars": stars, "commentary": commentary])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of stars this review gave, 1-5
      public var stars: Int {
        get {
          return snapshot["stars"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "stars")
        }
      }

      /// Comment about the movie
      public var commentary: String? {
        get {
          return snapshot["commentary"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "commentary")
        }
      }
    }
  }
}

public final class CreateAwesomeReviewMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateAwesomeReview {\n  createReview(episode: JEDI, review: {stars: 10, commentary: \"This is awesome!\"}) {\n    __typename\n    stars\n    commentary\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createReview", arguments: ["episode": "JEDI", "review": ["stars": 10, "commentary": "This is awesome!"]], type: .object(CreateReview.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createReview: CreateReview? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createReview": createReview.flatMap { $0.snapshot }])
    }

    public var createReview: CreateReview? {
      get {
        return (snapshot["createReview"] as? Snapshot).flatMap { CreateReview(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createReview")
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let possibleTypes = ["Review"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("stars", type: .nonNull(.scalar(Int.self))),
        GraphQLField("commentary", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(stars: Int, commentary: String? = nil) {
        self.init(snapshot: ["__typename": "Review", "stars": stars, "commentary": commentary])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of stars this review gave, 1-5
      public var stars: Int {
        get {
          return snapshot["stars"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "stars")
        }
      }

      /// Comment about the movie
      public var commentary: String? {
        get {
          return snapshot["commentary"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "commentary")
        }
      }
    }
  }
}

public final class HeroAndFriendsNamesQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNames($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    name\n    friends {\n      __typename\n      name\n    }\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero.flatMap { $0.snapshot }])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"] as? Snapshot).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public static func makeDroid(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeHuman(name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Human", "name": name])
        }

        public static func makeDroid(name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Droid", "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroAndFriendsNamesWithIDsQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNamesWithIDs($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    id\n    name\n    friends {\n      __typename\n      id\n      name\n    }\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero.flatMap { $0.snapshot }])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"] as? Snapshot).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "id": id, "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public static func makeDroid(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "id": id, "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the character
      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeHuman(id: GraphQLID, name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Human", "id": id, "name": name])
        }

        public static func makeDroid(id: GraphQLID, name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Droid", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the character
        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroAndFriendsNamesWithIdForParentOnlyQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNamesWithIDForParentOnly($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    id\n    name\n    friends {\n      __typename\n      name\n    }\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero.flatMap { $0.snapshot }])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"] as? Snapshot).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "id": id, "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public static func makeDroid(id: GraphQLID, name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "id": id, "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the character
      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeHuman(name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Human", "name": name])
        }

        public static func makeDroid(name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Droid", "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroAndFriendsNamesWithFragmentQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNamesWithFragment($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    name\n    ...FriendsNames\n    friends {\n      __typename\n      name\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(FriendsNames.fragmentString) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero.flatMap { $0.snapshot }])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"] as? Snapshot).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
        GraphQLField("friends", type: .list(.object(Friend.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public static func makeDroid(name: String, friends: [Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "name": name, "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var friendsNames: FriendsNames {
          get {
            return FriendsNames(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeHuman(name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Human", "name": name])
        }

        public static func makeDroid(name: String) -> Friend {
          return Friend(snapshot: ["__typename": "Droid", "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class HeroNameQuery: GraphQLQuery {
  public static let operationString =
    "query HeroName($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    name\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero.flatMap { $0.snapshot }])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"] as? Snapshot).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "name": name])
      }

      public static func makeDroid(name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class HeroNameWithIdQuery: GraphQLQuery {
  public static let operationString =
    "query HeroNameWithID($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    id\n    name\n  }\n}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero.flatMap { $0.snapshot }])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"] as? Snapshot).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(id: GraphQLID, name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "id": id, "name": name])
      }

      public static func makeDroid(id: GraphQLID, name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the character
      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class HeroNameWithFragmentQuery: GraphQLQuery {
  public static let operationString =
    "query HeroNameWithFragment($episode: Episode) {\n  hero(episode: $episode) {\n    __typename\n    ...HeroName\n  }\n}"

  public static var requestString: String { return operationString.appending(HeroName.fragmentString) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("hero", arguments: ["episode": GraphQLVariable("episode")], type: .object(Hero.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero.flatMap { $0.snapshot }])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"] as? Snapshot).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "name": name])
      }

      public static func makeDroid(name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var heroName: HeroName {
          get {
            return HeroName(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct FriendsNames: GraphQLFragment {
  public static let fragmentString =
    "fragment FriendsNames on Character {\n  __typename\n  friends {\n    __typename\n    name\n  }\n}"

  public static let possibleTypes = ["Human", "Droid"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("friends", type: .list(.object(Friend.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeHuman(friends: [Friend?]? = nil) -> FriendsNames {
    return FriendsNames(snapshot: ["__typename": "Human", "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
  }

  public static func makeDroid(friends: [Friend?]? = nil) -> FriendsNames {
    return FriendsNames(snapshot: ["__typename": "Droid", "friends": friends.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The friends of the character, or an empty list if they have none
  public var friends: [Friend?]? {
    get {
      return (snapshot["friends"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
    }
  }

  public struct Friend: GraphQLSelectionSet {
    public static let possibleTypes = ["Human", "Droid"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public static func makeHuman(name: String) -> Friend {
      return Friend(snapshot: ["__typename": "Human", "name": name])
    }

    public static func makeDroid(name: String) -> Friend {
      return Friend(snapshot: ["__typename": "Droid", "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the character
    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }
  }
}

public struct HeroName: GraphQLFragment {
  public static let fragmentString =
    "fragment HeroName on Character {\n  __typename\n  name\n}"

  public static let possibleTypes = ["Human", "Droid"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeHuman(name: String) -> HeroName {
    return HeroName(snapshot: ["__typename": "Human", "name": name])
  }

  public static func makeDroid(name: String) -> HeroName {
    return HeroName(snapshot: ["__typename": "Droid", "name": name])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the character
  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }
}