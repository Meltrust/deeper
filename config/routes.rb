Rails.application.routes.draw do
  resources :followings
  root "deeps#index"
  devise_for :users

  # get 'user/index'
  # get 'user/show'
  resources :users
  
  resources :deeps 
end
