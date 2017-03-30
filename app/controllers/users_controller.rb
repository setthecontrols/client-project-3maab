class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end
end
