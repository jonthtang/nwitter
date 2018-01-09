class FollowingsController < ApplicationController

  before_action :authenticate_user!
  before_action :prepare_user


  def create
    @relationship = Following.create(follower_id: current_user.id, followee_id: @user.id)
    redirect_to user_path(username: @user.username)
  end

  def destroy
    @check = Following.find_by(follower_id: current_user.id, followee_id: @user)
    @check.destroy
    redirect_to user_path(username: @user.username)
  end

  def prepare_user
    @user = User.find_by(username: params[:user_username])
  end

end
