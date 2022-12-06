Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  post '/login', to: 'users#login'
  resources :eventlists
  post '/eventlists/:id', to: 'eventlists#show_with_params'
end
