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
    @followedusers = current_user.followees
  end

  def update
    redirect_to landing_path unless user_signed_in?
    # if current_user.update(user_params)
    #   flash[:success] = 'Your picture has been updated'
    #   redirect_to home_path
    # else
    #   flash[:error] = 'Your picture has not been updated.'
    #   redirect_to home_path
    # end
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to home_path, :notice => 'User was successfully updated.' }
        format.json { respond_with_bip(current_user) }
      else
        format.html { redirect_to home_path, :notice => 'User was not successfully updated.' }
        format.json { respond_with_bip(current_user) }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio, :picture)
  end

end
