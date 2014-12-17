# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:load", ->
  h = $(window).height() - 74
  $(".embed-container").height h
  $("#presents-embed").height h
  $('.fancybox').fancybox()
  $(".fancybox-effects-d").fancybox
  padding: 0
  openEffect: "elastic"
  openSpeed: 150
  closeEffect: "elastic"
  closeSpeed: 150
  closeClick: true
  helpers:
    overlay: null

  return
