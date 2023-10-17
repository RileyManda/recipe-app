class RecipeFoodsController < ApplicationController
  def index
    @recipe_food = RecipeFood.all
  end

  def show
    @recipe_food = RecipeFood.find(params[:id])
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    if @recipe_food.save
      flash[:notice] = 'Ingredient added to the recipe.'
    else
      flash[:alert] = 'Failed to add the ingredient.'
    end

    # Redirect to the recipe show page
    redirect_to recipe_path(@recipe_food.recipe)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity, :value)
  end
end
