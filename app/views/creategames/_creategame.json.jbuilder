json.extract! creategame, :id, :name, :game_url, :user_id, :created_at, :updated_at
json.url creategame_url(creategame, format: :json)
