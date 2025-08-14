class CreateCreditEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :credit_entries do |t|
      t.references :credit_account, null: false, foreign_key: true
      t.decimal :amount, precision: 12, scale: 2
      t.string :note
      t.integer :entry_type

      t.timestamps
    end
    add_index :credit_entries, :entry_type
  end
end
