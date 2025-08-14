class Customer < ApplicationRecord
  has_one :credit_account, dependent: :destroy
  after_create { create_credit_account! }
  validates :name, presence: true
end
