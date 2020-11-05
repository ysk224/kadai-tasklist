Rails.application.routes.draw do
  root to: 'tasks#index'
  
  get 'sessions/new'
  
  get 'toppages/index'
  
  get 'users/index'
  get 'users/show'
  get 'users/new'
  
  get 'signup', to: 'users#new'
  get 'signin', to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :new, :create]
  resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
end
