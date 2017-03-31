class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :name, :ingredients, :difficulty, :prep_time, :category, :instructions, presence: true

  def self.total
    ratings.reduce(0) { |sum, rating| sum += rating.value }
  end
end