Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts
  get '/chat', to: 'chat#index'
end
