Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :warehouses, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :suppliers, only: [:index, :new, :create, :show, :edit, :update]
  resources :product_models, only: [:index, :new, :create]
end
