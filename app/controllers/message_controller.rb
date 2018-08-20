class MessageController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :note_id)
  end
end
