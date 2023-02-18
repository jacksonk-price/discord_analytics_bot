json.extract! member_voice_session, :id, :member_id, :channel_id, :discord_session_id, :time_joined, :time_left, :created_at, :updated_at
json.url member_voice_session_url(member_voice_session, format: :json)
