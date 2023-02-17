class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :discord_id
      t.integer :type

      t.timestamps
    end
  end
end
