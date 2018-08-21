document.addEventListener('turbolinks:load', function () {

  const messageForm = document.getElementById("new-message-form")
  const messageInput = document.getElementById("message-input")
  const messageContainer = document.getElementById("chat-contents")

  if (window.noteId && messageForm) {
    App.note_chat = App.cable.subscriptions.create(
      {
        channel: 'NoteChatChannel',
        room: window.noteId
      },
      {
        connected: function () {
          console.log("hello!")
          // Called when the subscription is ready for use on the server
        },

        disconnected: function () {
          // Called when the subscription has been terminated by the server
        },

        received: function (data) {
          var messageNode = document.createElement('div')
          messageNode.innerHTML = data.message
          messageContainer.appendChild(messageNode)
          // Called when there's incoming data on the websocket for this channel
        },

        sendMessage: function (content) {
          this.perform('send_message', { content: content, note_id: window.noteId })
        }
      }
    )

    messageForm.addEventListener('submit', function (e) {
      e.preventDefault()
      App.note_chat.sendMessage(messageInput.value)
      messageInput.value = ''
    })
  }
})
