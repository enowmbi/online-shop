Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :users, only: :show
  get 'users/show'
  resources :products do 
    member do
      get :add_to_cart
    end
  end
  resources :carts, only: :show
end
