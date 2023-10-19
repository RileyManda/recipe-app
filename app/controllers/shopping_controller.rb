class ShoppingController < ApplicationController
  def index
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: params[:recipe_id])
    @total_items = calculate_total_items
    @total_value = calculate_total_value
  end

  private

  def calculate_total_items
    total_items = 0
    @recipe_foods.each do |recipe_food|
      calculated_quantity = recipe_food.quantity - recipe_food.food.quantity
      total_items += calculated_quantity if calculated_quantity.positive?
    end
    total_items
  end

  def calculate_total_value
    total_value = 0
    @recipe_foods.each do |recipe_food|
      calculated_quantity = recipe_food.quantity - recipe_food.food.quantity
      total_value += calculated_quantity * recipe_food.food.price if calculated_quantity.positive?
    end
    total_value
  end
end
