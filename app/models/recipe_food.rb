class RecipeFood < ApplicationRecord
  self.table_name = 'recipe_foods'

  belongs_to :recipe, foreign_key: 'recipe_id'
  belongs_to :food, foreign_key: 'food_id'

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
