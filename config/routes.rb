Rails.application.routes.draw do
  # get 'cars/index'
  root to: 'cars#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index]
end
