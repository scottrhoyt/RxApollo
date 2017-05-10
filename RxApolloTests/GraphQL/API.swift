//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: String {
  case newhope = "NEWHOPE" /// Star Wars Episode IV: A New Hope, released in 1977.
  case empire = "EMPIRE" /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case jedi = "JEDI" /// Star Wars Episode VI: Return of the Jedi, released in 1983.
}

extension Episode: JSONDecodable, JSONEncodable {}

/// The input object sent when someone is creating a new review
public struct ReviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(stars: Int, commentary: String? = nil, favoriteColor: ColorInput? = nil) {
    graphQLMap = ["stars": stars, "commentary": commentary, "favoriteColor": favoriteColor]
  }
}

/// The input object sent when passing in a color
public struct ColorInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(red: Int, green: Int, blue: Int) {
    graphQLMap = ["red": red, "green": green, "blue": blue]
  }
}


public final class CreateReviewForEpisodeMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateReviewForEpisode($episode: Episode!, $review: ReviewInput!) {" +
    "  createReview(episode: $episode, review: $review) {" +
    "    __typename" +
    "    stars" +
    "    commentary" +
    "  }" +
    "}"

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
    public static let selections: [Selection] = [
      Field("createReview", arguments: ["episode": Variable("episode"), "review": Variable("review")], type: .object(Data.CreateReview.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createReview: CreateReview? = nil) {
      self.snapshot = ["createReview": createReview]
    }

    public var createReview: CreateReview? {
      get {
        return CreateReview(snapshot: snapshot["createReview"]! as! Snapshot)
      }
      set {
        snapshot["createReview"] = newValue?.snapshot
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("stars", type: .nonNull(.scalar(Int.self))),
        Field("commentary", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, stars: Int, commentary: String? = nil) {
        self.snapshot = ["__typename": __typename, "stars": stars, "commentary": commentary]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var stars: Int {
        get {
          return snapshot["stars"]! as! Int
        }
        set {
          snapshot["stars"] = newValue
        }
      }

      public var commentary: String? {
        get {
          return snapshot["commentary"]! as! String?
        }
        set {
          snapshot["commentary"] = newValue
        }
      }
    }
  }
}


public final class CreateAwesomeReviewMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateAwesomeReview {" +
    "  createReview(episode: JEDI, review: {stars: 10, commentary: \"This is awesome!\"}) {" +
    "    __typename" +
    "    stars" +
    "    commentary" +
    "  }" +
    "}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("createReview", arguments: ["episode": "JEDI", "review": ["stars": 10, "commentary": "This is awesome!"]], type: .object(Data.CreateReview.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createReview: CreateReview? = nil) {
      self.snapshot = ["createReview": createReview]
    }

    public var createReview: CreateReview? {
      get {
        return CreateReview(snapshot: snapshot["createReview"]! as! Snapshot)
      }
      set {
        snapshot["createReview"] = newValue?.snapshot
      }
    }

    public struct CreateReview: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("stars", type: .nonNull(.scalar(Int.self))),
        Field("commentary", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, stars: Int, commentary: String? = nil) {
        self.snapshot = ["__typename": __typename, "stars": stars, "commentary": commentary]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var stars: Int {
        get {
          return snapshot["stars"]! as! Int
        }
        set {
          snapshot["stars"] = newValue
        }
      }

      public var commentary: String? {
        get {
          return snapshot["commentary"]! as! String?
        }
        set {
          snapshot["commentary"] = newValue
        }
      }
    }
  }
}


public final class HeroAndFriendsNamesQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNames($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    name" +
    "    friends {" +
    "      __typename" +
    "      name" +
    "    }" +
    "  }" +
    "}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.snapshot = ["hero": hero]
    }

    public var hero: Hero? {
      get {
        return Hero(snapshot: snapshot["hero"]! as! Snapshot)
      }
      set {
        snapshot["hero"] = newValue?.snapshot
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
        Field("friends", type: .list(.object(Hero.Friend.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, name: String, friends: [Friend?]? = nil) {
        self.snapshot = ["__typename": __typename, "name": name, "friends": friends]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot["name"] = newValue
        }
      }

      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot["friends"] = newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(__typename: String, name: String) {
          self.snapshot = ["__typename": __typename, "name": name]
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot["__typename"] = newValue
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot["name"] = newValue
          }
        }
      }
    }
  }
}


public final class HeroAndFriendsNamesWithIDsQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNamesWithIDs($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    id" +
    "    name" +
    "    friends {" +
    "      __typename" +
    "      id" +
    "      name" +
    "    }" +
    "  }" +
    "}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.snapshot = ["hero": hero]
    }

    public var hero: Hero? {
      get {
        return Hero(snapshot: snapshot["hero"]! as! Snapshot)
      }
      set {
        snapshot["hero"] = newValue?.snapshot
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("id", type: .nonNull(.scalar(GraphQLID.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
        Field("friends", type: .list(.object(Hero.Friend.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, id: GraphQLID, name: String, friends: [Friend?]? = nil) {
        self.snapshot = ["__typename": __typename, "id": id, "name": name, "friends": friends]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot["id"] = newValue
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot["name"] = newValue
        }
      }

      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot["friends"] = newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("id", type: .nonNull(.scalar(GraphQLID.self))),
          Field("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(__typename: String, id: GraphQLID, name: String) {
          self.snapshot = ["__typename": __typename, "id": id, "name": name]
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot["__typename"] = newValue
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot["id"] = newValue
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot["name"] = newValue
          }
        }
      }
    }
  }
}


public final class HeroAndFriendsNamesWithIdForParentOnlyQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNamesWithIDForParentOnly($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    id" +
    "    name" +
    "    friends {" +
    "      __typename" +
    "      name" +
    "    }" +
    "  }" +
    "}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.snapshot = ["hero": hero]
    }

    public var hero: Hero? {
      get {
        return Hero(snapshot: snapshot["hero"]! as! Snapshot)
      }
      set {
        snapshot["hero"] = newValue?.snapshot
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("id", type: .nonNull(.scalar(GraphQLID.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
        Field("friends", type: .list(.object(Hero.Friend.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, id: GraphQLID, name: String, friends: [Friend?]? = nil) {
        self.snapshot = ["__typename": __typename, "id": id, "name": name, "friends": friends]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot["id"] = newValue
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot["name"] = newValue
        }
      }

      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot["friends"] = newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(__typename: String, name: String) {
          self.snapshot = ["__typename": __typename, "name": name]
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot["__typename"] = newValue
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot["name"] = newValue
          }
        }
      }
    }
  }
}


public final class HeroAndFriendsNamesWithFragmentQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriendsNamesWithFragment($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    name" +
    "    ...FriendsNames" +
    "    friends {" +
    "      __typename" +
    "      name" +
    "    }" +
    "  }" +
    "}"
  public static var requestString: String { return operationString.appending(FriendsNames.fragmentString) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.snapshot = ["hero": hero]
    }

    public var hero: Hero? {
      get {
        return Hero(snapshot: snapshot["hero"]! as! Snapshot)
      }
      set {
        snapshot["hero"] = newValue?.snapshot
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
        Field("friends", type: .list(.object(Hero.Friend.self))),
        FragmentSpread(FriendsNames.self),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, name: String, friends: [Friend?]? = nil) {
        self.snapshot = ["__typename": __typename, "name": name, "friends": friends]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot["name"] = newValue
        }
      }

      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot["friends"] = newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot = newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var friendsNames: FriendsNames {
          get {
            return FriendsNames(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("name", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(__typename: String, name: String) {
          self.snapshot = ["__typename": __typename, "name": name]
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot["__typename"] = newValue
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot["name"] = newValue
          }
        }
      }
    }
  }
}


public final class HeroNameQuery: GraphQLQuery {
  public static let operationString =
    "query HeroName($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.snapshot = ["hero": hero]
    }

    public var hero: Hero? {
      get {
        return Hero(snapshot: snapshot["hero"]! as! Snapshot)
      }
      set {
        snapshot["hero"] = newValue?.snapshot
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, name: String) {
        self.snapshot = ["__typename": __typename, "name": name]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot["name"] = newValue
        }
      }
    }
  }
}


public final class HeroNameWithIdQuery: GraphQLQuery {
  public static let operationString =
    "query HeroNameWithID($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    id" +
    "    name" +
    "  }" +
    "}"

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.snapshot = ["hero": hero]
    }

    public var hero: Hero? {
      get {
        return Hero(snapshot: snapshot["hero"]! as! Snapshot)
      }
      set {
        snapshot["hero"] = newValue?.snapshot
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("id", type: .nonNull(.scalar(GraphQLID.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String, id: GraphQLID, name: String) {
        self.snapshot = ["__typename": __typename, "id": id, "name": name]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot["id"] = newValue
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot["name"] = newValue
        }
      }
    }
  }
}


public final class HeroNameWithFragmentQuery: GraphQLQuery {
  public static let operationString =
    "query HeroNameWithFragment($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    ...HeroName" +
    "  }" +
    "}"
  public static var requestString: String { return operationString.appending(HeroName.fragmentString) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.snapshot = ["hero": hero]
    }

    public var hero: Hero? {
      get {
        return Hero(snapshot: snapshot["hero"]! as! Snapshot)
      }
      set {
        snapshot["hero"] = newValue?.snapshot
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        FragmentSpread(HeroName.self),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(__typename: String) {
        self.snapshot = ["__typename": __typename]
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot["__typename"] = newValue
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot = newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var heroName: HeroName {
          get {
            return HeroName(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }
      }
    }
  }
}

public struct FriendsNames: GraphQLFragment {
  public static let fragmentString =
    "fragment FriendsNames on Character {" +
    "  __typename" +
    "  friends {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"

  public static let possibleTypes = ["Human", "Droid"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("friends", type: .list(.object(FriendsNames.Friend.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(__typename: String, friends: [Friend?]? = nil) {
    self.snapshot = ["__typename": __typename, "friends": friends]
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot["__typename"] = newValue
    }
  }

  public var friends: [Friend?]? {
    get {
      return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
    }
    set {
      snapshot["friends"] = newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }
    }
  }

  public struct Friend: GraphQLSelectionSet {
    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("name", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(__typename: String, name: String) {
      self.snapshot = ["__typename": __typename, "name": name]
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot["__typename"] = newValue
      }
    }

    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot["name"] = newValue
      }
    }
  }
}

public struct HeroName: GraphQLFragment {
  public static let fragmentString =
    "fragment HeroName on Character {" +
    "  __typename" +
    "  name" +
    "}"

  public static let possibleTypes = ["Human", "Droid"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("name", type: .nonNull(.scalar(String.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(__typename: String, name: String) {
    self.snapshot = ["__typename": __typename, "name": name]
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot["__typename"] = newValue
    }
  }

  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot["name"] = newValue
    }
  }
}