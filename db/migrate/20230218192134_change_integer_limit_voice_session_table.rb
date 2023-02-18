class ChangeIntegerLimitVoiceSessionTable < ActiveRecord::Migration[7.0]
  def change
    change_column :member_voice_sessions, :discord_session_id, :integer, limit: 8
  end
end
