Rails.application.routes.draw do
  get 'users/:battletag', to: 'users#show'

  root 'pages#home'

  devise_for :users
end
