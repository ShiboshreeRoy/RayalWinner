class CreateCasinogames < ActiveRecord::Migration[7.2]
  def change
    create_table :casinogames do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
