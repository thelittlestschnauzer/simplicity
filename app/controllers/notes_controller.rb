class NotesController < ApplicationController


  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.save

    redirect_to notes_path(@note)
  end

  def index
    @notes = Note.all
  end


  def show
    @note = Note.find(params[:id])
  end


  private

  def note_params
    params.require(:note).permit(:title, :content, :created_on)
  end
end
