Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :consumers
  devise_for :promoters
  devise_for :venues

  # Root route
  root "events#index"

  # Basic resources
  resources :events
  resources :venues
  resources :orders, only: [:create, :show]
  
  # Nested resources
  resources :consumers do
    get 'orders', to: 'orders#index'
  end

  resources :promoters do
    get 'events', to: 'events#index'
  end

  resources :venues do
    get 'events', to: 'events#index'
  end
end
