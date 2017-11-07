# Getting Started

### Include your twitter consumer_key and consumer_secret
```app/services/twitter_service.rb```
```
def initialize(config={})
    config[:consumer_key]    ||= 'YOUR CONSUMER KEY'
    config[:consumer_secret] ||= 'YOUR CONSUMER SECRET'

    @client = Twitter::REST::Client.new(config)
  end
```

