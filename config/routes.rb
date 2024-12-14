Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :consumers
  devise_for :promoters
  devise_for :venues

  # Root route
  root "events#index"

  # Resources
  resources :events
  resources :venues
  
  # Consumer routes
  resources :consumers, only: [:show] do
    resources :orders, only: [:index], as: 'orders'
  end

  # Promoter routes
  resources :promoters, only: [:show] do
    resources :events, only: [:index], as: 'events'
  end

  # Venue routes
  resources :venues do
    resources :events, only: [:index], as: 'events'
  end

  # Orders
  resources :orders, only: [:create, :show]

  # Events-related routes
  resources :events_consumers, only: [:create, :destroy]
  resources :events_promoters, only: [:create, :destroy]
end
