class ChangeIdTypeInUserUnreadTweet < ActiveRecord::Migration[5.1]
  def change
    change_column :user_unread_tweets, :tweet_id, :text
    change_column :user_unread_tweets, :twitter_user_id, :text
  end
end
