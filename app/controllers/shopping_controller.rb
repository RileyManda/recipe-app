class ShoppingController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods
    @total_items = @recipe_foods.sum(:quantity)
    @total_value = 0

    @recipe_foods.each do |recipe_food|
      food = recipe_food.food
      calculated_quantity = recipe_food.quantity - food.quantity
      if calculated_quantity > 0
        @total_value += calculated_quantity * food.price
      end
    end
  end
end
