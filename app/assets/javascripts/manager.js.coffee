# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initTabs = ->
  # Manager's Tabs
  managerTabsList = [
    "managerTabOne"
    "managerTabTwo"
    "managerTabThree"
    "managerTabFour"
  ]
  accordionsAndTabsController managerTabsList, "managerTabOne"
  # GodParents' Tabs
  tabsList = [
    "tabOne"
    "tabTwo"
    "tabThree"
    "tabFour"
    "tabFive"
    "tabSix"
    "tabSeven"
    "tabEight"
    "tabNine"
    "tabTen"
    "tabEleven"
    "tabTwelve"
    "tabThirteen"
    "tabFourteen"
  ]
  accordionsAndTabsController tabsList, "tabOne"
  return

$(document).on "page:load", ->
  initTabs()
  return

$(document).ready ->
  initTabs()
  return
