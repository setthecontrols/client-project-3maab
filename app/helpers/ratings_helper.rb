module RatingsHelper

  def tallyvotes
    #selects the last item voted on
    @last_rating = Rating.last
    #gets the last item voted on's id
    @last_rating_recipe_id = Rating.last.recipe_id
    #selects the ratings value column witht he desired recipe id
    recipe_rating = Rating.where(recipe_id: @last_rating_recipe_id).select("value")
    #sums the total count
    total_count = recipe_rating.reduce(0) { |sum, rating| sum += rating.value }
    #returns average count
    average_count = (total_count.to_f/recipe_rating.count)
    #updates the average count into the recipe votes column
    @last_rating.recipe.update(votes: average_count)
  end

end
