Rails.application.routes.draw do
   devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  # devise_for :users, controllers: { registrations: 'users/registrations',
  #   sessions: 'users/sessions', unlocks: 'users/unlocks',
  #   passwords: 'users/passwords', confirmations: 'users/confirmations'}

  root to: "home#index"
  # resources :users do
    
  #   resources :gift

  # end
  

          
  end       
