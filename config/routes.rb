Rails.application.routes.draw do
  resources :blacklists
  get 'orders/print'
  get 'compte/commandes_paiement_validation'
  get 'contact', to: 'contact#index'
  get 'information/confidentialite'
  get 'information/conditions'
  get 'information/livraison'
  get 'compte/commandes_paiement'
  resources :subcategories
  resources :customisations
  get 'compte/wishlist'
  get 'carts/commander'
  get 'carts/show'
  get 'compte/commandes_detail'
  get 'compte/commandes'
  get 'compte/evenements'
  get 'evenements/evenement'
  get 'boutique/produit'
  post 'contact/send_mail'
  get 'contact', to: 'contact#index'
  get 'evenements', to: 'evenements#index'
  get 'boutique', to: 'boutique#index'
  devise_for :users, controllers: { registrations: "users/registrations" }
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
  resources :wishlists
  resources :compte

  #get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
