class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :name, :ingredients, :difficulty, :prep_time, :category, :instructions, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



  def self.total
    ratings.reduce(0) { |sum, rating| sum += rating.value }
  end
end