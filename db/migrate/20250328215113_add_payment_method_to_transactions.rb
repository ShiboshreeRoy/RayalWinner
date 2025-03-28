class AddPaymentMethodToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :payment_method, :string
  end
end
