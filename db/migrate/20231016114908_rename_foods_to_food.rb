class RenameFoodsToFood < ActiveRecord::Migration[7.0]
  def change
    rename_table :foods, :food
  end
end
