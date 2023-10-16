class RenameRecipesToRecipe < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipes, :recipe
  end
end
