class ShoppingController < ApplicationController
  def index
    @recipe_foods = current_user.recipe_foods
    @foods = Food.all
    @total_items = 0
    @total_value = 0

    @recipe_foods.each do |recipe_food|
      food = @foods.find_by(id: recipe_food.food_id)
      if food
        calculated_quantity = recipe_food.quantity - food.quantity
        if calculated_quantity > 0
          @total_items += calculated_quantity
          @total_value += calculated_quantity * food.price
        end
      end
    end
  end
end
