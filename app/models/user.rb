class User < ApplicationRecord
  has_secure_password

  has_many :recipes
  has_many :ratings

  validates_uniqueness :email, :username
  validates_presence_of :first_name, :last_name, :email, :username, :password_digest
end
