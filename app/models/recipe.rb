class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :name, :ingredients, :difficulty, :prep_time, :category, :instructions, presence: true
end
