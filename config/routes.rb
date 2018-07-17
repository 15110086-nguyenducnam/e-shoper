Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  # devise_for :users
  root to: 'home#index'
  get 'admin/dashboard', to: 'admin/dashboard#index'
  devise_for :users, controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  resources :products do
    get "productdetail"
  end
  namespace :admin do
  resources :categories, :products
  end
  resources :cart, only: [:show, :index]
  resources :order_items, only: [:create, :update, :destroy]
  resources :home
  resources :categories
end
