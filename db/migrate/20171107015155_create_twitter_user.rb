class CreateTwitterUser < ActiveRecord::Migration[5.1]
  def change
    create_table :twitter_users do |t|
      t.integer :twitter_id, null: false
      t.string :screen_name, null: false

      t.timestamp
    end

    add_index :twitter_users, [:twitter_id, :screen_name]
  end
end
