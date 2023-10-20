class RecipeFoodsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :set_recipe
  def index; end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def show
    @recipe_food = RecipeFood.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)
    selected_food = Food.find(recipe_food_params[:food_id])
    @recipe_food.food = selected_food

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully added.'
    else
      puts @recipe_food.errors.full_messages
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.destroy
      redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully removed.'
    else
      redirect_to recipe_path(@recipe), alert: 'Failed to remove the ingredient.'
    end
  end

  def generate_shopping_list
  @total_items = calculate_total_items
  @total_value = calculate_total_value

  render 'shopping_list'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity, :value, :recipe_id)
  end
end

def calculate_total_items
  total_items = 0

  if @recipe_foods.present?
    @recipe_foods.each do |recipe_food|
      total_items += recipe_food.quantity
    end
  end

  total_items
end

def calculate_total_value
  total_value = 0

  if @recipe_foods.present?
    @recipe_foods.each do |recipe_food|
      total_value += recipe_food.quantity * recipe_food.food.price
    end
  end

  total_value
end
