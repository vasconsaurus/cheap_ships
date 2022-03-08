Rails.application.routes.draw do
  devise_for :users

  resources :vehicles, only: %i[new create edit update show index destroy] do
    resources :orders, only: %i[new create show]
  end

  resources :orders, only: :destroy

  get 'my_vehicles', to: 'vehicles#my_vehicles', as: 'my_vehicles'
  root to: 'vehicles#index'
end
