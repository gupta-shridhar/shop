module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :phone, String, null: true
    field :credit_account, Types::CreditAccountType, null: false
  end
end
