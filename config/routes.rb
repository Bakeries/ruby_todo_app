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
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  #sessions routes
  get '/auth/login', to: 'sessions#index'
  post '/auth/login', to: 'sessions#login'

  get '/signup', to: 'users#new' # getting url
  post '/signup', to: 'users#create' # save user to db

  post '/auth/logout', to: 'sessions#destroy'
  get '/auth/logout', to: 'sessions#destroy'

  # /todos get and post
  # get '/todos', to: 'todo_lists#index'
  # post '/todos/new', to: 'todo_lists#new'

  # /todos/:id get, put, delete
end