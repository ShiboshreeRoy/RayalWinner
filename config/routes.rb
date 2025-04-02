Rails.application.routes.draw do
  resources :creategames
  get "widthdraw/index"
  
  resources :casinogames, only: [:index, :new, :edit, :update, :destroy, :show]
  devise_for :users
  resources :admin, only: [:index, :create, :update]
  resources :your_profile
  
  resources :transactions, only: [:index, :new, :create, :show] do
    member do
      get 'approve'
      get 'reject'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
   root "home#index"
end
