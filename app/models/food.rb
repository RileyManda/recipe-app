class Food < ApplicationRecord
  self.table_name = 'food'
  belongs_to :user
  has_many :recipe_food
  has_many :recipes, through: :recipe_food
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
