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
  resources :recipe_food, only: [:create]
  get '/public_recipes', to: 'recipe#public_recipes', as: 'public_recipes'
  post 'recipe/:recipe_id/recipe_foods', to: 'recipe_foods#create', as: 'add_ingredient_to_recipe'
end
