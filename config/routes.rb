Rails.application.routes.draw do
  resources :posts, :likes, :users

  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  get '/likes/post_id/:id', to: 'likes#post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
