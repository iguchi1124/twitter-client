Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/logout' => 'sessions#destroy', as: :sign_out
  get '/tweet', to: 'home#tweet', as: 'tweet'
  get '/timeline', to: 'home#timeline', as: 'timeline'
end
