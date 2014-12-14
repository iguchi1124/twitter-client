Rails.application.routes.draw do
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/sign_out' => 'sessions#destroy', as: :sign_out
  get '/tweet', to: 'twitter/functions#tweet', as: 'tweet'
  get '/timeline', to: 'twitter/functions#timeline', as: 'timeline'
  get '/mentions_timeline', to: 'twitter/functions#mentions_timeline', as: 'mentions_timeline'
  get '/follow', to: 'twitter/functions#follow', as: 'follow'
  get '/followers', to: 'twitter/functions#followers', as: 'followers'
end
