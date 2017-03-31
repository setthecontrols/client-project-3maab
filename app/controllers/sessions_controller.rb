class SessionsController < ApplicationController
include SessionsHelper
  def new

  end

  def create
    @user = User.find_by_email(params[:session][:email])
    @recipes = @user.recipes
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash.notice = "Welcome back '#{@user.username}'!!!"
      render 'users/show'
    else
      flash.notice = "Login failed....please try again."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

    def session_params
      params.require(:user).permit(:email, :password)
    end

end
