class AddAttributesToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :name, :string
    add_column :recipes, :preparation_time, :integer
    add_column :recipes, :cooking_time, :integer
    add_column :recipes, :description, :text
    add_column :recipes, :public, :boolean
    add_reference :recipes, :user, null: false, foreign_key: true
  end
end
