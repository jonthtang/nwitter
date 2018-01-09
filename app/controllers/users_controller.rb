class UsersController < ApplicationController

  def index
    @users = User.all
    if user_signed_in?
      @mypeople = current_user.followees
      @newusers = User.all - @mypeople
    end
  end

  def show
    @user = User.find_by(username: params[:username])
  end

end
