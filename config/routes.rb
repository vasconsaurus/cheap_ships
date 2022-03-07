Rails.application.routes.draw do
  devise_for :users

  resources :vehicles, only: %i[new create edit update show index destroy] do
    resources :orders, only: %i[new create show]
  end

  root to: 'vehicles#index'

end
