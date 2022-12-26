Rails.application.routes.draw do
  root to: 'home#index'
  resources :films,      only: [:show, :new, :create, :edit, :update, :destroy]
  resources :categories, only: [:show, :new, :create]
end
