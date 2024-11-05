Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
      }
  
  root "home#index"

  resources :events, only: [:index, :show]

  resources :bookings, only: %i[create]

  namespace :booking do
    resources :events
  end 
end
