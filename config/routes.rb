Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }
  
  root "home#index"

  resources :events, only: [:index, :show]

  resources :bookings, only: %i[create] do
    get :booking_details, on: :member 
    get :all_bookings, on: :collection
  end

  namespace :booking do
    resources :events do
      patch :soft_deleted_events, on: :member
    end
  end 
end
