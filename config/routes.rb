Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  get 'profile/:region/:battletag', to: 'users#show'
end
