Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tweets#search_twitter_user'

  get 'tweets_by_user', to: 'tweets#tweets_by_user'

  patch 'mark_as_read/:tweet_id', to: 'tweets#read'
end
