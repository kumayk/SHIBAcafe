class RelationshipsController < ApplicationController
before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user.create_notification_by(current_user)
      redirect_to user_path(@user)
  end

  def destroy
  	@user = User.find(params[:user_id])
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
      redirect_to user_path(@user)
  end
end