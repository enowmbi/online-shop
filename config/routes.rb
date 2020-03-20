Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :users, only: :show
  resources :products do 
    member do
      get :add_to_cart
    end
  end
  resources :carts, only: :show
  resources :categories
end
