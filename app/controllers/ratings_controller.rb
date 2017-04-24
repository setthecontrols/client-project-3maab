class RatingsController < ApplicationController

  include RatingsHelper

  def index
  end

  def create 
    @rating = Rating.new(:user_id => params[:user_id], :recipe_id => params[:recipe_id], :value => params[:value])

    # (:user_id => params[:user_id])
    
    if Rating.exists?(:user_id => params[:user_id], :recipe_id => params[:recipe_id])
      flash.notice = "You can only rate the same recipe once a week!"
    else
      @rating.save 
      flash.notice = "You're rating is recorded!"
    end

    #initiates the tally vote helper that will update the database
    tallyvotes

    redirect_to "/"
  end

end