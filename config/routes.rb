Rails.application.routes.draw do
  resources :offers
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
  get 'success', to: 'pages#success'

  resources :offers do
      resources :bookings, only: [ :new, :create]
  end
  resources :bookings, only: [ :update ]

end
