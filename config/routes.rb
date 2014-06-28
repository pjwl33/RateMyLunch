Rails.application.routes.draw do
  devise_for :users
  resources :meals
end
