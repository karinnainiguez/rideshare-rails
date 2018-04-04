Rails.application.routes.draw do
  root 'trips#index'

  resources :trips

  resources :drivers

  resources :passengers do
    resources :trips, only:[:index, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
