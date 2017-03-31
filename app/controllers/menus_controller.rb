class MenusController < ApplicationController
  def show
    @recipes = Recipe.all
    @appetizers = Recipe.where(category: "appetizers")
    @entrees = Recipe.where(category: "entrees")
    @salads = Recipe.where(category: "salads")
    @desserts = Recipe.where(category: "desserts")
  end
end


private

def rating_total
  @appetizers.each do |appetizer|
    app_ratings = appetizer.ratings
    total = app_ratings.reduce(0) { |sum, rating| sum += rating.value }
    return total
  end
end
