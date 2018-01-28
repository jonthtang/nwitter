class NotesController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def index
    @notes = current_user.notes.all
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)
    @note.save
    redirect_to user_notes_path
  end

  def update
    @note = current_user.notes.find(params[:id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to(@note, :notice => 'Note was successfully updated.') }
        format.json { respond_with_bip(@note) }
      else
        format.html { render :action => "index" }
        format.json { respond_with_bip(@note) }
      end
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy
    redirect_to user_notes_path
  end

  def show
    @note = Note.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end

private
  def note_params
    params.require(:note).permit(:title, :body)
  end

end
