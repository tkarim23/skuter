Rails.application.routes.draw do
  devise_for :users
  root to: 'models#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :models, only: [:index, :show]


  resources :scooters, only: [:show, :delete, :edit, :update, :new, :create ] do
    resources :bookings, only: [:create]
end

  resources :bookings, only: [:show] do
    resources :reviews, only: [:create]
  end

  get "user_dashboard", to: "pages#user_dashboard"
  post "confirm_booking/:booking_id", to: "bookings#confirm_booking", as: :confirm_booking
end
