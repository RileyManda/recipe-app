class RecipeFoodController < ApplicationController
  def index;
      @recipe_food = RecipeFood.all
  end

end

  def show
  @recipe = Recipe.find(params[:id])
end

end
