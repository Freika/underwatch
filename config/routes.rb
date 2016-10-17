Rails.application.routes.draw do
  devise_for :users
  resources :characters
  root to: 'events#index'

  resources :events
end
