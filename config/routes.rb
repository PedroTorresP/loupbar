Rails.application.routes.draw do
  get 'carts/commander'
  get 'carts/show'
  get 'compte/commandes_detail'
  get 'compte/commandes'
  get 'compte/evenements'
  get 'evenements/evenement'
  get 'boutique/produit'
  get 'contact/index'
  get 'evenements/index'
  get 'boutique/index'
  devise_for :users
  resources :events
  resources :participants
  resources :users
  resources :orders
  resources :buys
  resources :categories
  resources :products
  resources :evenements
  resources :line_items
  resources :carts
  #get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
