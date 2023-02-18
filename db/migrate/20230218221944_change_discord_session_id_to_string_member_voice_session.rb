class ChangeDiscordSessionIdToStringMemberVoiceSession < ActiveRecord::Migration[7.0]
  def change
    change_column :member_voice_sessions, :discord_session_id, :string
  end
end
