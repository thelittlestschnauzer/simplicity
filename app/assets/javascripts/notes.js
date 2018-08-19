
document.addEventListener('turbolinks:load', function () {

  // the elements had to be assigned into variables
  const openNoteButton = document.getElementById('new-note-button')
  const notePopover = document.getElementById('new-note-popover')

  // this will check to see if the elements even exist. If they don't a warning will populate. (hopefully)
  if (openNoteButton && notePopover) {
    openNoteButton.addEventListener('click', function () {
      // if the note popover class list contains the 'is-hidden' class, remove it, otherwise return null
      return notePopover.classList.contains('is-hidden') ? notePopover.classList.remove('is-hidden') : null
    }, false)

    const cancelNotePopover = document.getElementById('cancel-note-popover')

    cancelNotePopover.addEventListener('click', function () {

      return notePopover.classList.add('is-hidden')
    }, false)

  }
})
