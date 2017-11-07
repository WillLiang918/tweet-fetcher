class TwitterService
  require 'twitter'
  attr_reader :client

  def initialize(config={})
    config[:consumer_key]    ||= 'YOUR CONSUMER KEY'
    config[:consumer_secret] ||= 'YOUR CONSUMER SECRET'

    @client = Twitter::REST::Client.new(config)
  end

  def ingest_new_tweets(user, new_tweets)
    new_tweets.each do |tweet|
      UserUnreadTweet.create({
                                 user_id:         user.id,
                                 tweet_id:        tweet.id,
                                 twitter_user_id: tweet.user.id,
                                 text:            tweet.text
                             })
    end
  end
end