Rails.application.routes.draw do

  get 'users/show'
  root to: 'products#index'
  devise_for :users
  resources :users, only: :show
  resources :products
end
