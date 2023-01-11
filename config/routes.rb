Rails.application.routes.draw do
  resources :photos
  root to: 'home#index'
  resources :films,      only: [:show, :new, :create, :edit, :update] 
  
  resources :categories, only: [:show, :new, :create]

  resources :directors,  only: [:show, :new, :create]
end
