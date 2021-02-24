Rails.application.routes.draw do

  root 'images#index'

  resources :images
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#logout'
  get 'admin', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

end
