Rails.application.routes.draw do
  get 'users/show'

  root 'pages#home'

  devise_for :users
end
