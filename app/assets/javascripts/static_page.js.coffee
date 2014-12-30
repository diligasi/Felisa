# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


initAccordion = ->
  # Accordion
  accordionList = [
    "accordionOne"
    "accordionTwo"
    "accordionThree"
  ]
  accordionsAndTabsController accordionList, "accordionOne"
  return

$(document).on "page:load", ->
  h = $(window).height() - 74
  $(".embed-container").height h
  $("#presents-embed").height h
  initAccordion()
  return

$(document).ready ->
  h = $(window).height() - 74
  $(".embed-container").height h
  $("#presents-embed").height h
  initAccordion()
  return
