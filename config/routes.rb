Rails.application.routes.draw do
  apipie
  devise_for :users

  # API
  namespace :api do
    namespace :v1 do
      post :register, to: 'registrations#create'
      post :login, to: 'sessions#create'
      
      delete :logout, to: 'sessions#destroy'

      resources :products, only: [:index]
    end
  end
end
