class CreateMemberVoiceSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :member_voice_sessions do |t|
      t.references :member, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.integer :discord_session_id
      t.datetime :time_joined
      t.datetime :time_left

      t.timestamps
    end
  end
end
