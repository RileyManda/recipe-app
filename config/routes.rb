Rails.application.routes.draw do
  root 'food#index'

  resources :food, only: [:index, :new, :create]
  resources :recipe, only: [:index, :new, :create]
  delete 'recipes/:id', to: 'recipes#destroy', as: 'remove_recipe'
  resources :users, only: [:index, :show, :new, :create]
  resources :recipe_food, only: [:index, :new, :create]
  resources :recipe, only: [:index, :new, :create, :show, :update, :destroy]
end