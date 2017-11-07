class TweetsController < ApplicationController
  DEFAULT_COUNT = 30

  def search_twitter_user
  end

  def tweets_by_user
    client = twitter_service.client
    fetched_user   = client.user(params[:search])
  end

  def twitter_service
    @twitter_service ||= TwitterService.new
  end
end
