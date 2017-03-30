class PagesController < ApplicationController
  def home
    @entrees = Recipe.all.where(category: "entre")
  end
end
