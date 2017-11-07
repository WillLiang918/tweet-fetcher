class UserUnreadTweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_user, primary_key: 'twitter_id'

  scope :for_twitter_user, ->(twitter_user_id) { where(twitter_user_id: twitter_user_id) }
  scope :unread, -> { where(read: 0) }
end
