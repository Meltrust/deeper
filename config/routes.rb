Rails.application.routes.draw do
  root "deeps#index"
  devise_for :users

  # get 'user/index'
  # get 'user/show'
  resources :users, only: [:index, :show]
  
  resources :deeps 
end
