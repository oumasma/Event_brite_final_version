Rails.application.routes.draw do
  devise_for :users
  get root 'events#index'

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  
  resources :events do
    resources :attendances
    resources :event_pictures, only: [:create]
    #permet de créer les routes permettant d'attacher les photos
  end

  resources :charges

  #routes admin
  namespace :admin do
    resources :users, :events
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
