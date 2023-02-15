class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.integer :discord_id
      t.string :display_name
      t.string :nickname

      t.timestamps
    end
  end
end
