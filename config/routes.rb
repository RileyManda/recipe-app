Rails.application.routes.draw do
  root 'food#index'

  resources :food, only: [:index, :new, :create] do
    resources :recipes, only: [:index, :new, :create]
  end

  resources :users, only: [:index, :show, :new, :create]
  resources :recipe_food, only: [:index, :new, :create]
  resources :recipes, only: [:index, :new, :create]
end
