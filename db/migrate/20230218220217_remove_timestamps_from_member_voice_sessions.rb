class RemoveTimestampsFromMemberVoiceSessions < ActiveRecord::Migration[7.0]
  def change
    remove_column :member_voice_sessions, :created_at, :string
    remove_column :member_voice_sessions, :updated_at, :string
  end
end
