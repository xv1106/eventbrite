Rails.application.routes.draw do
  resources :attendances
  resources :events

  devise_for :users
  resources :users, only:[:update, :edit, :show]

  # Define root path
  root "events#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
