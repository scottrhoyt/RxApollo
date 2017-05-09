//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: String {
  case newhope = "NEWHOPE" /// Star Wars Episode IV: A New Hope, released in 1977.
  case empire = "EMPIRE" /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case jedi = "JEDI" /// Star Wars Episode VI: Return of the Jedi, released in 1983.
}

extension Episode: JSONDecodable, JSONEncodable {}

public final class HeroNameQuery: GraphQLQuery {
  public static let operationDefinition =
    "query HeroName($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"

  public let episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLMappable {
    public let hero: Hero?

    public init(reader: GraphQLResultReader) throws {
      hero = try reader.optionalValue(for: Field(responseName: "hero", arguments: ["episode": reader.variables["episode"]]))
    }

    public struct Hero: GraphQLMappable {
      public let __typename: String
      /// The name of the character
      public let name: String

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        name = try reader.value(for: Field(responseName: "name"))
      }
    }
  }
}

public final class HeroNameWithIdQuery: GraphQLQuery {
  public static let operationDefinition =
    "query HeroNameWithID($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    id" +
    "    name" +
    "  }" +
    "}"

  public let episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLMappable {
    public let hero: Hero?

    public init(reader: GraphQLResultReader) throws {
      hero = try reader.optionalValue(for: Field(responseName: "hero", arguments: ["episode": reader.variables["episode"]]))
    }

    public struct Hero: GraphQLMappable {
      public let __typename: String
      /// The ID of the character
      public let id: GraphQLID
      /// The name of the character
      public let name: String

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        id = try reader.value(for: Field(responseName: "id"))
        name = try reader.value(for: Field(responseName: "name"))
      }
    }
  }
}