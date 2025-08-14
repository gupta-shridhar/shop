# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :customer, Types::CustomerType, null: true do
      argument :id, ID, required: true
    end

    field :customers, Types::CustomerType.connection_type, null: false do
      argument :search, String, required: false
    end

    field :account_balance, Types::DecimalType, null: false do
      argument :customer_id, ID, required: true
    end

    def customer(id:)
      Customer.includes(credit_account: :credit_entries).find_by(id:)
    end

    def customers(search: nil)
      scope = Customer.includes(:credit_account)
      scope = scope.where("name ILIKE ? OR phone ILIKE ?", "%#{search}%", "%#{search}%") if search.present?
      scope.order(id: :desc)
    end

    def account_balance(customer_id:)
      Customer.find(customer_id).credit_account.balance
    end
  end
end
