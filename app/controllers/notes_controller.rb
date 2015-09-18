class NotesController < ApplicationController
  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.save
    redirect_to track_url(note.track_id)
  end

  def edit
    
  end

  def destroy
    note = Note.find(params[:id])
    if note.user_id == current_user.id
      track = note.track_id
      note.destroy
      redirect_to track_url(note.track_id)
    else
      render text: "403 FORBIDDEN???"
    end
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
