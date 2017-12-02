class UsersController < ApplicationController

  def index
    @users = User.all
    @new = Book.new
  end


  def show
  	@user = User.find(params[:id])
    @mm = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @image = User.new
  end

  def createn
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private
	  def user_params
	  	params.require(:user).permit(:name, :introduction,:image)
	  end
end