Rails.application.routes.draw do
  devise_for :users

  resources :events
  resources :participations, only: [:create, :destroy] do
    post :approve, on: :member
  end

  root 'pages#home'

  get 'profile/:region/:battletag', to: 'users#show', as: :profile
end
