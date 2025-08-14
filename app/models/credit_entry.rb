class CreditEntry < ApplicationRecord
  belongs_to :credit_account

  enum :entry_type, { credit_given: 0, payment: 1 }

  # Convention: credit_given → positive amount, payment → negative amount; we’ll enforce that in mutations.
  validates :amount, presence: true
end
