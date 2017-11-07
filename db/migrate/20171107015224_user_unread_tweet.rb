class UserUnreadTweet < ActiveRecord::Migration[5.1]
  def change
    create_table :user_unread_tweet do |t|
      t.integer :user_id, null: false
      t.integer :tweet_id, null: false
      t.integer :twitter_user_id, null: false
      t.integer :read, default: 0

      t.timestamp
    end

    add_index :twitter_users, [:user_id, :tweet_id, :twitter_user_id], name: 'idx_twitter_user_on_user_tweet_twit_user_id'
  end
end
