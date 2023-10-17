class Food < ApplicationRecord
  self.table_name = 'foods'
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
