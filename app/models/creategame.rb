class Creategame < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :name, presence: true
  validates :game_url, presence: true
  validates :image, presence: true
end
