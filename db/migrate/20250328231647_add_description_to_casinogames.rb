class AddDescriptionToCasinogames < ActiveRecord::Migration[7.2]
  def change
    add_column :casinogames, :description, :text
  end
end
