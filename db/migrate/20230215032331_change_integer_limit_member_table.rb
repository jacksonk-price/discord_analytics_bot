class ChangeIntegerLimitMemberTable < ActiveRecord::Migration[7.0]
  def change
    change_column :members, :discord_id, :integer, limit: 8
  end
end
