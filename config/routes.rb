Rails.application.routes.draw do
  resources :characters
  root to: 'events#index'

  resources :events
end
