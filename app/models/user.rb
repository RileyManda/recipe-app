class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  # attr_accessor :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
  #               :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
  has_many :recipes, dependent: :destroy
  has_many :recipes
  has_many :foods
  has_many :foods, dependent: :destroy
  has_many :recipe_foods, through: :recipes
end
