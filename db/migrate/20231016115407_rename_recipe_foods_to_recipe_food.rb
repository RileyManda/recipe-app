class RenameRecipeFoodsToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipe_foods, :recipe_food
  end
end
