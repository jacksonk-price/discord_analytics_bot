json.extract! channel, :id, :name, :discord_id, :type, :created_at, :updated_at
json.url channel_url(channel, format: :json)
