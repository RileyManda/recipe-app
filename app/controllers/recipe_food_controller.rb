class RecipeFoodController < ApplicationController
  def index
    @recipe_food = RecipeFood.all
  end
end

def show
  @recipe_food = RecipeFood.find(params[:id])
end
