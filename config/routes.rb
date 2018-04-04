Rails.application.routes.draw do
  root 'trips#index'

  resources :trips
  get '/trips/new/:id', to: 'trips#new', as: 'requested_trip'

  resources :drivers

  resources :passengers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
