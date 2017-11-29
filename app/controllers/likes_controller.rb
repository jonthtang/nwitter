class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :prepare_note

  def create
    @like = @note.likes.build(user: current_user)
    @like.save
    redirect_to user_path(username: @user.username)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, note_id: @note.id)
    @like.destroy
    redirect_to user_path(username: @user.username)
  end

  private
    def like_params
      params.require(:like).permit(:user_id, :note_id)
    end

    def prepare_note
      @user = User.find_by(username: params[:user_username])
      @note = Note.find(params[:id])
    end

end
