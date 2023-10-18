class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :recipes
  has_many :foods
  has_many :foods, dependent: :destroy
  has_many :recipe_foods, through: :recipes
end
