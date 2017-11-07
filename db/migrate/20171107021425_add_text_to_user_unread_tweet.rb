class AddTextToUserUnreadTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :user_unread_tweets, :text, :string
  end
end
