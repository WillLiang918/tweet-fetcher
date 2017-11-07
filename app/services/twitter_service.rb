class TwitterService
  require 'twitter'
  attr_reader :client

  def initialize(config={})
    config[:consumer_key]    ||= 'YOUR CONSUMER KEY'
    config[:consumer_secret] ||= 'YOUR CONSUMER SECRET'

    @client = Twitter::REST::Client.new(config)
  end
end