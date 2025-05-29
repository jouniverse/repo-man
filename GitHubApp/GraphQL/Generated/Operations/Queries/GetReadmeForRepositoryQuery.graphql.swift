// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GitHubGraphQLAPI {
  class GetReadmeForRepositoryQuery: GraphQLQuery {
    static let operationName: String = "GetReadmeForRepository"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetReadmeForRepository($owner: String!, $name: String!) { repository(owner: $owner, name: $name) { __typename readme: object(expression: "HEAD:README.md") { __typename ... on Blob { text } } } }"#
      ))

    public var owner: String
    public var name: String

    public init(
      owner: String,
      name: String
    ) {
      self.owner = owner
      self.name = name
    }

    public var __variables: Variables? { [
      "owner": owner,
      "name": name
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
          .field("object", alias: "readme", Readme?.self, arguments: ["expression": "HEAD:README.md"]),
        ] }

        /// A Git object in the repository
        var readme: Readme? { __data["readme"] }

        /// Repository.Readme
        ///
        /// Parent Type: `GitObject`
        struct Readme: GitHubGraphQLAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Interfaces.GitObject }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsBlob.self),
          ] }

          var asBlob: AsBlob? { _asInlineFragment() }

          /// Repository.Readme.AsBlob
          ///
          /// Parent Type: `Blob`
          struct AsBlob: GitHubGraphQLAPI.InlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = GetReadmeForRepositoryQuery.Data.Repository.Readme
            static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Blob }
            static var __selections: [ApolloAPI.Selection] { [
              .field("text", String?.self),
            ] }

            /// UTF8 text data or null if the Blob is binary
            var text: String? { __data["text"] }
          }
        }
      }
    }
  }

}