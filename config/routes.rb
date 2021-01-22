# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'dashboard#index'

  resources :users, except: %i[new create] do
    scope nil, module: :users do
      resource :admins, only: %i[create destroy]

      resources :bookings, only: %i[create show index destroy] do
        scope nil, module: :bookings do
          resource :check_in, only: %i[create destroy]
        end
      end
    end
  end

  resources :airlines
  resources :aircrafts
  resources :airports

  resources :flights
end
