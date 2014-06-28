Rails.application.routes.draw do
  devise_for :users

  root to: 'users#show'

  resources :users, only: [:show]
  resources :meals
  resources :ratings, only: [:create, :destroy]
end
