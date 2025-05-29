// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GitHubGraphQLAPI {
  class GetRepositoriesByUserNameQuery: GraphQLQuery {
    static let operationName: String = "GetRepositoriesByUserName"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetRepositoriesByUserName($username: String!) { user(login: $username) { __typename repositories(first: 20, orderBy: { field: CREATED_AT, direction: DESC }) { __typename nodes { __typename id name description createdAt url stargazerCount } } } }"#
      ))

    public var username: String

    public init(username: String) {
      self.username = username
    }

    public var __variables: Variables? { ["username": username] }

    struct Data: GitHubGraphQLAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("user", User?.self, arguments: ["login": .variable("username")]),
      ] }

      /// Lookup a user by login.
      var user: User? { __data["user"] }

      /// User
      ///
      /// Parent Type: `User`
      struct User: GitHubGraphQLAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("repositories", Repositories.self, arguments: [
            "first": 20,
            "orderBy": [
              "field": "CREATED_AT",
              "direction": "DESC"
            ]
          ]),
        ] }

        /// A list of repositories that the user owns.
        var repositories: Repositories { __data["repositories"] }

        /// User.Repositories
        ///
        /// Parent Type: `RepositoryConnection`
        struct Repositories: GitHubGraphQLAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.RepositoryConnection }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node?]?.self),
          ] }

          /// A list of nodes.
          var nodes: [Node?]? { __data["nodes"] }

          /// User.Repositories.Node
          ///
          /// Parent Type: `Repository`
          struct Node: GitHubGraphQLAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Repository }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", GitHubGraphQLAPI.ID.self),
              .field("name", String.self),
              .field("description", String?.self),
              .field("createdAt", GitHubGraphQLAPI.DateTime.self),
              .field("url", GitHubGraphQLAPI.URI.self),
              .field("stargazerCount", Int.self),
            ] }

            var id: GitHubGraphQLAPI.ID { __data["id"] }
            /// The name of the repository.
            var name: String { __data["name"] }
            /// The description of the repository.
            var description: String? { __data["description"] }
            /// Identifies the date and time when the object was created.
            var createdAt: GitHubGraphQLAPI.DateTime { __data["createdAt"] }
            /// The HTTP URL for this repository
            var url: GitHubGraphQLAPI.URI { __data["url"] }
            /// Returns a count of how many stargazers there are on this object
            ///
            var stargazerCount: Int { __data["stargazerCount"] }
          }
        }
      }
    }
  }

}