class TwitterUser < ApplicationRecord
  has_many :tweets, class_name: 'UserUnreadTweet'
end
