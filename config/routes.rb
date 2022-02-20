Rails.application.routes.draw do

  root 'sessions#login'

  #users routes
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  #sessions routes
  get '/auth/login', to: 'sessions#login'
  post '/auth/login', to: 'sessions#create'

  get '/signup', to: 'users#new' # getting url
  post '/signup', to: 'users#create' # adding user to db

  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

end