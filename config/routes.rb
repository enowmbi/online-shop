Rails.application.routes.draw do
  root to: 'categories#index'
  devise_for :users
  resources :users, only: :show
  resources :products do 
    member do
      get :add_to_cart
      resources :reviews
    end
  end
  resources :carts, only: :show do 
    member do
      post :pay
    end
  end
  resources :categories  
end
