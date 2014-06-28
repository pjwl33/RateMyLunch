Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :meals
  resources :ratings, only: [:create, :destroy]
end
