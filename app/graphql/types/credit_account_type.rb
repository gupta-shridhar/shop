module Types
  class CreditAccountType < Types::BaseObject
    field :id, ID, null: false
    field :customer_id, Integer, null: false

    # Use connection for pagination of entries
    field :entries, Types::CreditEntryType.connection_type, null: false    
    field :balance, Types::DecimalType, null: false

    def entries
      object.credit_entries.order(id: :desc)
    end

    def balance
      object.balance
    end
  end
end
