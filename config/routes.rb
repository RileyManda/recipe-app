Rails.application.routes.draw do
  root 'food#index'

  resources :food, only: [:index, :new, :create] do
    resources :recipe, controller: 'recipe' do
      post 'add_ingredient_to_recipe', on: :member
    end
  end

  resources :recipe, only: [:index, :new, :create, :show, :update, :destroy] do
    resources :recipe_foods, only: [:new, :create]
  end

  delete 'recipe/:id', to: 'recipe#destroy', as: 'remove_recipe'

  resources :users, only: [:index, :show, :new, :create]
  resources :recipe_foods, only: [:index, :new, :create]

  get '/public_recipes', to: 'recipe#public_recipes', as: 'public_recipes'

  post 'recipe/:recipe_id/recipe_foods', to: 'recipe_foods#create', as: 'add_ingredient_to_recipe'
  post 'recipe_foods', to: 'recipe_foods#create', as: 'create_recipe_food'
end
