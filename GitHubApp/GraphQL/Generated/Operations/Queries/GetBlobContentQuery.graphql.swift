// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GitHubGraphQLAPI {
  class GetBlobContentQuery: GraphQLQuery {
    static let operationName: String = "GetBlobContent"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetBlobContent($owner: String!, $name: String!, $oid: GitObjectID!) { repository(owner: $owner, name: $name) { __typename object(oid: $oid) { __typename ... on Blob { text byteSize isBinary } } } }"#
      ))

    public var owner: String
    public var name: String
    public var oid: GitObjectID

    public init(
      owner: String,
      name: String,
      oid: GitObjectID
    ) {
      self.owner = owner
      self.name = name
      self.oid = oid
    }

    public var __variables: Variables? { [
      "owner": owner,
      "name": name,
      "oid": oid
    ] }

    struct Data: GitHubGraphQLAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("repository", Repository?.self, arguments: [
          "owner": .variable("owner"),
          "name": .variable("name")
        ]),
      ] }

      /// Lookup a given repository by the owner and repository name.
      var repository: Repository? { __data["repository"] }

      /// Repository
      ///
      /// Parent Type: `Repository`
      struct Repository: GitHubGraphQLAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Repository }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("object", Object?.self, arguments: ["oid": .variable("oid")]),
        ] }

        /// A Git object in the repository
        var object: Object? { __data["object"] }

        /// Repository.Object
        ///
        /// Parent Type: `GitObject`
        struct Object: GitHubGraphQLAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Interfaces.GitObject }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsBlob.self),
          ] }

          var asBlob: AsBlob? { _asInlineFragment() }

          /// Repository.Object.AsBlob
          ///
          /// Parent Type: `Blob`
          struct AsBlob: GitHubGraphQLAPI.InlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = GetBlobContentQuery.Data.Repository.Object
            static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Blob }
            static var __selections: [ApolloAPI.Selection] { [
              .field("text", String?.self),
              .field("byteSize", Int.self),
              .field("isBinary", Bool?.self),
            ] }

            /// UTF8 text data or null if the Blob is binary
            var text: String? { __data["text"] }
            /// Byte size of Blob object
            var byteSize: Int { __data["byteSize"] }
            /// Indicates whether the Blob is binary or text. Returns null if unable to determine the encoding.
            var isBinary: Bool? { __data["isBinary"] }
          }
        }
      }
    }
  }

}