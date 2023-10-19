class FoodController < ApplicationController
  load_and_authorize_resource
  def new
    @food = Food.new
  end

  def index
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @food.user = User.first

    if @food.save
      redirect_to food_index_path, notice: 'Ingredient was successfully created.'

    else
      redirect_to new_food_path, alert: 'Cannot create a new ingredient.'
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to food_index_path, notice: 'Food successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
