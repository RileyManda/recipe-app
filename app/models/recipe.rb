class Recipe < ApplicationRecord
  self.table_name = 'recipes'
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'
  has_many :foods, through: :recipe_foods
  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false] }
end
