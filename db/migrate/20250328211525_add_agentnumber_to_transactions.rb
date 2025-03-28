class AddAgentnumberToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :agentnumber, :string
  end
end
