class RecipeFoodController < ApplicationController
  def index
    @recipe_food = RecipeFood.all
  end
end

def show
  @recipe_food = RecipeFood.find(params[:id])
end

def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    if @recipe_food.save
      redirect_to your_recipe_path, notice: 'Ingredient added to recipe.'
    else

    end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity, :recipe_id)
  end
end
