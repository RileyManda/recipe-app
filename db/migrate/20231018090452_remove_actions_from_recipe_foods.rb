class RemoveActionsFromRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :actions, :string
  end
end
