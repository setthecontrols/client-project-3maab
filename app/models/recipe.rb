class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :name, :ingredients, :difficulty, :prep_time, :category, :instructions, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/





  def self.total
    ratings.reduce(0) { |sum, rating| sum += rating.value }
  end

  def self.generate_menu
    Recipe.where('created_at = ?', last_thursday).where('created_at -7 ?', last_thursday)
    # Date.beginning_of_week=(:thursday)
    # weekly_recipies = Recipe.all
    # weekly_recipies.where(creaeted_at:(Date.beginning_of_week - 7))

  end

  def self.last_thursday
    date  = Date.parse("thursday")
    delta = date < Date.today ? 0 : 7
    date - delta
  end
end
