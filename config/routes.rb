Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'

  resources :vehicles, only: %i[new create edit show index destroy]
end
