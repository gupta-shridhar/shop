module Types
  class CreditEntryType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Types::DecimalType, null: false
    field :note, String, null: true
    field :entry_type, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
