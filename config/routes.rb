Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/logout' => 'sessions#destroy', as: :sign_out
  get '/tweet', to: 'home#tweet', as: 'tweet'
  get '/timeline', to: 'home#timeline', as: 'timeline'
  get '/mentions_timeline', to: 'home#mentions_timeline', as: 'mentions_timeline'
  get '/follow', to: 'home#follow', as: 'follow'
  get '/followers', to: 'home#followers', as: 'followers'
end
