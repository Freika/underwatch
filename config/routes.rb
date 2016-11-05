Rails.application.routes.draw do
  resources :events
  devise_for :users

  root 'pages#home'

  get 'profile/:region/:battletag', to: 'users#show'
end
