Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/edit'
  root to: 'categories#index'
  devise_for :users
  resources :users, only: :show
  resources :products do 
    member do
      get :add_to_cart
    end
  end
  resources :carts, only: :show do 
    member do
      post :pay
    end
  end
  resources :categories  
end
