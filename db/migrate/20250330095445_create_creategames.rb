class CreateCreategames < ActiveRecord::Migration[7.2]
  def change
    create_table :creategames do |t|
      t.string :name
      t.string :game_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
