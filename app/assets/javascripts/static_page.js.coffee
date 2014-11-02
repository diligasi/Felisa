# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Tela da lista de presentes
$(document).ready ->
  $("#presents-iframe").on "load", ->
    $("#loading").hide()
    $(".iframe-container").show()
    return

  $("#presents-iframe").on "change", ->
    alert "flsdfsdkfds"
    $("#loading").show()
    $(".iframe-container").hide()
    return

  return
