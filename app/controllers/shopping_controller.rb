class ShoppingController < ApplicationController
  def index
    @recipe = Recipe.find(params[])
    @recipe_foods = @recipe.recipe_foods
    @total_items = @recipe_foods.sum(:quantity)
    @total_value = @recipe_foods.sum { |recipe_food| recipe_food.quantity * recipe_food.food.price }
  end
end
