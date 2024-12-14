Rails.application.routes.draw do
  # Root route
  root "pages#home"

  # Devise routes for authentication
  devise_for :venues
  devise_for :promoters
  devise_for :consumers

  # Resource routes
  resources :venues, only: [:index, :show] do
    resources :events, only: [:index]
  end

  resources :events, only: [:index, :show] do
    resources :orders, only: [:create]
    member do
      post 'rsvp'
      delete 'cancel_rsvp'
    end
  end

  # Namespaced routes for different user types
  namespace :venue do
    resources :events
    resources :promoters, only: [:index]
  end

  namespace :promoter do
    resources :events, only: [:index, :show]
    resources :venues, only: [:index, :show]
  end

  namespace :consumer do
    resources :events, only: [:index, :show]
    resources :orders, only: [:index, :show]
  end
end
