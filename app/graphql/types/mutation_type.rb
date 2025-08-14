# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :create_customer, mutation: Mutations::CreateCustomer
    field :add_credit, mutation: Mutations::AddCredit
    field :record_payment, mutation: Mutations::RecordPayment
  end
end
