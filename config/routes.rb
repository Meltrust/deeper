Rails.application.routes.draw do
  root "deeps#index"

  devise_for :users

  resources :users

  resources :deeps do
        resources :likes, only: [:create, :destroy]
  end
  
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  
end
