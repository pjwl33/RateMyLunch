Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show'
  resources :users, only: [:show]
  resources :meals, except: [:edit, :update, :destroy]
  resources :ratings, only: [:create, :destroy]
end
