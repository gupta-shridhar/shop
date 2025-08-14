class ShopApiSchema < GraphQL::Schema
  query(Types::QueryType)
  mutation(Types::MutationType)

  use GraphQL::Dataloader # helps avoid N+1
end
