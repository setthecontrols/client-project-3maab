class MenusController < ApplicationController
  def index
    @recipes = Recipe.all
    @appetizers = Recipe.where(category: "appetizers")
    @entrees = Recipe.where(category: "entrees")
    @salads = Recipe.where(category: "salads")
    @desserts = Recipe.where(category: "desserts")
  end
end


# private


# def app_rating_total
#   @totals = []
#   @appetizers.each do |appetizer|
#     app_ratings = appetizer.ratings
#     total = app_ratings.reduce(0) { |sum, rating| sum += rating.value }
#     @totals << total
#   end
#   @top_5 = @totals.sort.last(5)
#   @top_5_apps = @appetizers.where(@totals.include? @top_5)
  
#   # @top_5_apps.each do |appetizer|
#   #   return appetizer.name
#   # end
# end


