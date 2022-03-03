Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'

  resources :vehicles, only: %i[new create show index destroy]
end
