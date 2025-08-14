module Mutations
  class AddCredit < BaseMutation
    argument :customer_id, ID, required: true
    argument :amount, Types::DecimalType, required: true
    argument :note, String, required: false

    field :account, Types::CreditAccountType, null: true
    field :errors, [String], null: false

    def resolve(customer_id:, amount:, note: nil)
      raise GraphQL::ExecutionError, "Amount must be > 0" unless amount.to_d > 0
      account = Customer.find(customer_id).credit_account
      account.credit_entries.create!(amount: amount, note:, entry_type: :credit_given)
      { account:, errors: [] }
    rescue => e
      { account: nil, errors: [e.message] }
    end
  end
end
