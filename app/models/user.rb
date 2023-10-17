class User < ApplicationRecord
  has_many :recipes
  has_many :foods
  attr_accessor :email
  attr_accessor :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
                :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
end
