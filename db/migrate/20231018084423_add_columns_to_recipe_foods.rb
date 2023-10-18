class AddColumnsToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_foods, :food, :string
    add_column :recipe_foods, :value, :decimal
    add_column :recipe_foods, :actions, :text
  end
end
