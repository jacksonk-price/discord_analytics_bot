json.extract! member, :id, :discord_id, :display_name, :nickname, :created_at, :updated_at
json.url member_url(member, format: :json)
