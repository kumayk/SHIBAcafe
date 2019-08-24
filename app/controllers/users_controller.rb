class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:update]

  def show
  	 @user = User.find(params[:id])
  end

  def edit
  	 @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  def follows
     @user = User.find(params[:id])
     @users = user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
