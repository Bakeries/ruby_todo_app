Rails.application.routes.draw do

  root 'sessions#home'

  #users routes
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  #sessions routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

end