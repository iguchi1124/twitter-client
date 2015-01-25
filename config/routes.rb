Rails.application.routes.draw do
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/sign_out', to: 'sessions#destroy', as: :sign_out
  get '/timeline', to: 'twitter/functions#timeline', as: 'timeline'
  get '/mentions_timeline', to: 'twitter/functions#mentions_timeline', as: 'mentions_timeline'
  get '/friends', to: 'twitter/functions#friends', as: 'friends'
  get '/followers', to: 'twitter/functions#followers', as: 'followers'
  post '/tweet', to: 'twitter/functions#tweet', as: 'tweet'
  post '/favorite', to:'twitter/functions#favorite', as: 'favorite'
  post '/retweet', to:'twitter/functions#retweet', as: 'retweet'
end
