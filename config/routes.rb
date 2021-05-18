Rails.application.routes.draw do
  get 'offers/index', to: 'offers#index'
  get 'offers/:id', to: 'offers#show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
