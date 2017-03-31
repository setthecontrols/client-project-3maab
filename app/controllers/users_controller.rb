class UsersController < ApplicationController
  include SessionsHelper
  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login
      flash.notice = "Thanks for registering '#{@user.username}'!!!!"
      redirect_to recipes_path
    else
      flash.notice = "We were unable to sign you up... please try again."
      redirect_to '/users/new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def update
  end

  private

  def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
