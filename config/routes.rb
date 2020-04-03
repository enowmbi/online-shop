Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'categories#index'
  devise_for :users
  resources :users, only: :show
  resources :products do 
    member do
      get :add_to_cart
    end
    resources :reviews
  end
  resources :carts, only: :show do 
    member do
      post :pay
    end
  end
  resources :categories  
end
