class PagesController < ApplicationController
  def home
    @entrees = Recipe.where(category: "entrees").last(5)
    @appetizers = Recipe.where(category: "appetizers").last(5)
    @salads = Recipe.where(category: "salads").last(5)
    @desserts = Recipe.where(category: "desserts").last(5)
  end
end
