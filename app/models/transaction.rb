class Transaction < ApplicationRecord
  belongs_to :user
  has_one_attached :screenshot

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :amount, presence: true, numericality: { greater_than: 0 }
   # Add payment_method validation if needed
 # validates :payment_method, presence: true, inclusion: { in: ['Nagad', 'Rocket', 'Bkash', 'Upay'], message: "%{value} is not a valid payment method" }
  
  validates :transaction_code, presence: true
  #validates :screenshot, presence: true
end
