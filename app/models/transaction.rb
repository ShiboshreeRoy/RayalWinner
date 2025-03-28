class Transaction < ApplicationRecord
  belongs_to :user
  has_one_attached :screenshot

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :transaction_code, presence: true
  validates :screenshot, presence: true
end
