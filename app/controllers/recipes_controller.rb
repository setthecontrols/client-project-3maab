class RecipesController < ApplicationController
  # before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  # def create
  #   @recipe = Recipe.new(recipe_params)
  #
  #   respond_to do |format|
  #     if @recipe.save
  #       # format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
  #       # format.json { render :show, status: :created, location: @recipe }
  #       redirect_to recipes_path
  #     else
  #       format.html { render :new }
  #       format.json { render json: @recipe.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
   @recipe = Recipe.new(recipe_params)
   @recipe.user_id = current_user.id

   @recipe.save

   flash.notice = "Recipe '#{@recipe.name}' Created!"

   redirect_to recipe_path(@recipe)
 end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def recipe_params
     params.require(:recipe).permit(:name, :ingredients, :difficulty, :prep_time, :category, :instructions, :image)
  end

end
