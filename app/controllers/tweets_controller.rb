class TweetsController < ApplicationController
  DEFAULT_COUNT = 30

  def search_twitter_user
  end

  def tweets_by_user
    client       = twitter_service.client
    fetched_user = client.user(params[:search])

    twitter_user = TwitterUser.find_or_create_by(twitter_id: fetched_user.id) do |twitter_user|
      twitter_user.screen_name = fetched_user.screen_name
    end

    options = {
        count: DEFAULT_COUNT,
    }

    tweets_by_user     = current_user.tweets.for_twitter_user(twitter_user.twitter_id)
    last_tweet         = tweets_by_user.order('tweet_id').last

    options[:since_id] = last_tweet.tweet_id if last_tweet.present?

    new_tweets = client.user_timeline(twitter_user.screen_name, options)

    @twitter_service.ingest_new_tweets(current_user, new_tweets)

    @tweets = current_user.tweets.unread.for_twitter_user(twitter_user.twitter_id)
  end

  def read
    tweet = UserUnreadTweet.find(params[:tweet_id])
    tweet.update_attribute(:read, 1)
    twitter_user = tweet.twitter_user
    twitter_user.screen_name

    redirect_to tweets_by_user_path(search: twitter_user.screen_name)
  end

  private

  def twitter_service
    @twitter_service ||= TwitterService.new
  end
end
