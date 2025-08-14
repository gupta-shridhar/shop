class CreditAccount < ApplicationRecord
  belongs_to :customer
  has_many :credit_entries, dependent: :destroy

  def balance_cents
    # stored as decimal; convert to cents only if you later switch to integers
  end

  def balance
    credit_entries.sum(:amount) # positive for credit, negative for payment
  end
end
