module Mutations
  class CreateCustomer < BaseMutation
    argument :name, String, required: true
    argument :phone, String, required: false

    field :customer, Types::CustomerType, null: true
    field :errors, [String], null: false

    def resolve(name:, phone: nil)
      customer = Customer.create(name:, phone:)
      if customer.persisted?
        { customer:, errors: [] }
      else
        { customer: nil, errors: customer.errors.full_messages }
      end
    end
  end
end
