class NoteChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    note = Note.find(params[:room])
    stream_from "note_channel_#{note.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    note_id = data["note_id"]
    content = data["content"]

    message = Message.create!(content: content, note_id: note_id)
    ActionCable.server.broadcast("note_channel_#{note_id}", message: render_message(message))
  end

  private

  def render_message(message)
    MessageController.render partial: 'message/message', locals: {message: message}
  end
end
