// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GitHubGraphQLAPI {
  class CreateRepositoryMutation: GraphQLMutation {
    static let operationName: String = "CreateRepository"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CreateRepository($name: String!, $description: String, $visibility: RepositoryVisibility!, $clientMutationId: String) { createRepository( input: { name: $name visibility: $visibility description: $description clientMutationId: $clientMutationId } ) { __typename clientMutationId } }"#
      ))

    public var name: String
    public var description: GraphQLNullable<String>
    public var visibility: GraphQLEnum<RepositoryVisibility>
    public var clientMutationId: GraphQLNullable<String>

    public init(
      name: String,
      description: GraphQLNullable<String>,
      visibility: GraphQLEnum<RepositoryVisibility>,
      clientMutationId: GraphQLNullable<String>
    ) {
      self.name = name
      self.description = description
      self.visibility = visibility
      self.clientMutationId = clientMutationId
    }

    public var __variables: Variables? { [
      "name": name,
      "description": description,
      "visibility": visibility,
      "clientMutationId": clientMutationId
    ] }

    struct Data: GitHubGraphQLAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("createRepository", CreateRepository?.self, arguments: ["input": [
          "name": .variable("name"),
          "visibility": .variable("visibility"),
          "description": .variable("description"),
          "clientMutationId": .variable("clientMutationId")
        ]]),
      ] }

      /// Create a new repository.
      var createRepository: CreateRepository? { __data["createRepository"] }

      /// CreateRepository
      ///
      /// Parent Type: `CreateRepositoryPayload`
      struct CreateRepository: GitHubGraphQLAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GitHubGraphQLAPI.Objects.CreateRepositoryPayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("clientMutationId", String?.self),
        ] }

        /// A unique identifier for the client performing the mutation.
        var clientMutationId: String? { __data["clientMutationId"] }
      }
    }
  }

}