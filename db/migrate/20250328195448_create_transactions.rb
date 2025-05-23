class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :transaction_code
      t.string :screenshot
      t.integer :status

      t.timestamps
    end
  end
end
