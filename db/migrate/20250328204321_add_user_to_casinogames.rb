class AddUserToCasinogames < ActiveRecord::Migration[7.2]
  def change
    add_reference :casinogames, :user, null: false, foreign_key: true
  end
end
