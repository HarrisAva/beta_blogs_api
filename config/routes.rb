Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  resources :blogs
  resources :users, only: [:create]

  post '/blogs', to: 'blogs#create'
end
