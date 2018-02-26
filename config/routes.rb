Rails.application.routes.draw do

  root 'movies#index'

  resources :actors
  resources :movies
  resources :directors
  resources :users

  # get "/signup" => 'users#new'

  get "/sessions/new" => 'sessions#new'
  post "/sessions" => 'sessions#create'
  get "/logout" => 'sessions#destroy'


end
