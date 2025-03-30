class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transactions
  has_many :casinogames, dependent: :destroy
  has_many :creategames, dependent: :destroy
  enum role: {standard: 0, admin: 1}
 
  
end
