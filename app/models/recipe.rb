class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: { message: 'Cannot be empty' }
  validates :preparation_time, presence: { message: 'Cannot be empty' },
                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: { message: 'Cannot be empty' },
                           numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: { message: 'Cannot be empty' }
  validates :public, inclusion: { in: [true, false] }
end
