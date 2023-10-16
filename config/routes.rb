Rails.application.routes.draw do
  # config/routes.rb
root 'foods#index'
resources :foods, only: [:index, :new, :create]
resources :users, only: [:index, :show, :new, :create]
resources :recipe_foods, only: [:index, :new, :create]
resources :recipes, only: [:index, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
