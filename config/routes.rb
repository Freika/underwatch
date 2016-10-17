Rails.application.routes.draw do
  devise_for :users
  root to: 'runs#index'

  resources :runs
  resources :characters
  resources :events
end
