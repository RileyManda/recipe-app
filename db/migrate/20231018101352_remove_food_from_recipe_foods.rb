class RemoveFoodFromRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :food, :string
  end
end
