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

  def landing
    @notes = Note.last(3)
  end

  def home
    redirect_to landing_path unless user_signed_in?
    @followedusers = Following.where(follower_id: current_user.id)
  end

  def update
    redirect_to landing_path unless user_signed_in?
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to(current_user, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(current_user) }
      else
        format.html { render :controller => "user", :action => "home" }
        format.json { respond_with_bip(current_user) }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio, :picture)
  end

end
