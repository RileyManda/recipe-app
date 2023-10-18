class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all
  end

def new
  @recipe = Recipe.new
end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
    @recipe_food = RecipeFood.new
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipe_index_path, notice: 'Recipe was successfully deleted.'
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.public = recipe_params[:public] == '1'

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe updated successfully.'
    else
      render :edit
    end
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true)
  end

  def add_ingredient
    @recipe = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if @recipe_food.save
      @show_ingredient_form = true
      flash[:notice] = 'Ingredient added successfully.'
    else
      flash[:alert] = 'Failed to add the ingredient.'
    end
    render :show
  end

  private

  def recipe_food_params
    params.require(:recipe).require(:recipe_foods_attributes).permit(:food_id, :quantity, :value)
  end
end
