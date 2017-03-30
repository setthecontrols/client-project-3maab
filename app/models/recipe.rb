class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates_presence_of :name, :ingredients, :difficulty, :prep_time, :category, :instructions
end
