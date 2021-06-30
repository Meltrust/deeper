Rails.application.routes.draw do
  resources :deeps
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "deeps#index"
end
