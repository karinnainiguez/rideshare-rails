Rails.application.routes.draw do
  get 'catch_all/index'

  root 'trips#index'

  resources :trips

  resources :drivers

  resources :passengers do
    resources :trips, only:[:index, :new, :create]
  end


  match '*path', to: 'catch_all#index', via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
