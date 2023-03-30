Rails.application.routes.draw do
  root           to: 'home#index'
  resources      :films,      only: [:show, :new, :create, :edit, :update] do 
    patch :publish, on: :member
    patch :unpublish, on: :member
  end
  resources      :directors,  only: [:show, :new, :create, :edit, :update, :delete, :index]
  resources      :categories, only: [:new, :create, :index, :delete, :show]
end
