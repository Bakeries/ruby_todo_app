Rails.application.routes.draw do

  resources :todo_lists do
    resources :todo_items
  end
  namespace :todo_list do
    resources :todo_items
  end

  resources :users
  root 'sessions#index'

  #users routes
  resources :users, only: [:new, :create]

  # Login routes
  get '/auth/login', to: 'sessions#index'
  post '/auth/login', to: 'sessions#login'

  # Signup routes
  get '/signup', to: 'users#new' # displaying signup ui
  post '/signup', to: 'users#create' # save user to db

  # Logout routes
  post '/auth/logout', to: 'sessions#destroy' # executing method destroy
  get '/auth/logout', to: 'sessions#destroy' # calling method destroy
end