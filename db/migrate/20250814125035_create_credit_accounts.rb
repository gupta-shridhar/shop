class CreateCreditAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :credit_accounts do |t|
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
