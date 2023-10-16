class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipe_path, notice: 'Recipe was successfully deleted.'
  end
end
