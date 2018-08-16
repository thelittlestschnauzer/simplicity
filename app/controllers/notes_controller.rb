class NotesController < ApplicationController

  def index
    @notes = Note.all
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|

      if @note.save
        format.js
      else
        format.json { render json: @note.errors.messages, status: :unprocessable_entity }
      end
    end
  end


  def show
    @note = Note.find(params[:id])
  end


  private

  def note_params
    params.require(:note).permit(:title, :content, :created_on, :user_id)
  end
end
