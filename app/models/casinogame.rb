class Casinogame < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    validates :name, presence: true
    validates :description, presence: true
    validates :image, presence: true
end
