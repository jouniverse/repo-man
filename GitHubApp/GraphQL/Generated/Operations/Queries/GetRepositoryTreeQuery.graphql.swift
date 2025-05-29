// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GitHubGraphQLAPI {
  class GetRepositoryTreeQuery: GraphQLQuery {
    static let operationName: String = "GetRepositoryTree"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetRepositoryTree($owner: String!, $name: String!, $path: String = "HEAD:") { repository(owner: $owner, name: $name) { __typename object(expression: $path) { __typename ... on Tree { entries { __typename name type oid } } } } }"#
      ))

    public var owner: String
    public var name: String
    public var path: GraphQLNullable<String>

    public init(
      owner: String,
      name: String,
      path: GraphQLNullable<String> = "HEAD:"
    ) {
      self.owner = owner
      self.name = name
      self.path = path
    }

    public var __variables: Variables? { [
      "owner": owner,
      "name": name,
      "path": path
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
          .field("object", Object?.self, arguments: ["expression": .variable("path")]),
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
            .inlineFragment(AsTree.self),
          ] }

          var asTree: AsTree? { _asInlineFragment() }

          /// Repository.Object.AsTree
          ///
          /// Parent Type: `Tree`
          struct AsTree: GitHubGraphQLAPI.InlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = GetRepositoryTreeQuery.Data.Repository.Object
            static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Tree }
            static var __selections: [ApolloAPI.Selection] { [
              .field("entries", [Entry]?.self),
            ] }

            /// A list of tree entries.
            var entries: [Entry]? { __data["entries"] }

            /// Repository.Object.AsTree.Entry
            ///
            /// Parent Type: `TreeEntry`
            struct Entry: GitHubGraphQLAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.TreeEntry }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("name", String.self),
                .field("type", String.self),
                .field("oid", GitHubGraphQLAPI.GitObjectID.self),
              ] }

              /// Entry file name.
              var name: String { __data["name"] }
              /// Entry file type.
              var type: String { __data["type"] }
              /// Entry file Git object ID.
              var oid: GitHubGraphQLAPI.GitObjectID { __data["oid"] }
            }
          }
        }
      }
    }
  }

}