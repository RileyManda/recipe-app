Rails.application.routes.draw do
  root 'food#index'

  resources :food, only: [:index, :new, :create] do
    resources :recipe, controller: 'recipe'
  end
  resources :recipe, only: [:index]
  delete 'recipe/:id', to: 'recipe#destroy', as: 'remove_recipe'
  resources :users, only: [:index, :show, :new, :create]
  resources :recipe_food, only: [:index, :new, :create]
  resources :recipe, only: [:index, :new, :create, :show, :update, :destroy]
  get '/public_recipe', to: 'recipe#public_recipe', as: 'public_recipe'
end
