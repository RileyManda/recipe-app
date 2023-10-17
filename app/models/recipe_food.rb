class RecipeFood < ApplicationRecord
  self.table_name = 'recipe_foods'
  belongs_to :recipes, foreign_key: 'recipe_id'
  belongs_to :foods, foreign_key: 'food_id'
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
