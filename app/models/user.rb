class User < ApplicationRecord
  has_secure_password

  has_many :recipes
  has_many :ratings

  validates :email, :username, uniqueness: true
  validates :first_name, :last_name, :email, :username, :password_digest, presence: true
end
