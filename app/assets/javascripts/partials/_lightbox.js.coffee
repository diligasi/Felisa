closeLightbox = ->
  $("#lightbox, #fade").css display: "none"
  $("#lightbox").css
    height: "410px"
    width: "818"

  return

#    $('.content').remove();
$(document).on "click", ".icon-close", (event) ->
  closeLightbox()
  return
