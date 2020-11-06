Rails.application.routes.draw do
  root to: 'tasks#index'
  
  get 'sessions/new'
  
  get 'toppages/index'
  
  get 'users/index'
  get 'users/show'
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:index, :show, :create]
  resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
end
