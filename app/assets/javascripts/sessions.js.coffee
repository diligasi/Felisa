# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "submit", "#login_form", ->
  $("#loginPost").addClass "btn-activated"
  setTimeout (->
    $("#loginPost").removeClass "btn-activated"
    return
  ), 1000
  valuesToSubmit = $(this).serialize()
  $.ajax
    url: $(this).attr("action")
    type: "POST"
    dataType: "json"
    data: valuesToSubmit
    complete: (data) ->
      if data.status is 200
        document.write data.responseText
      else
        alert 'oops'
        $(".login-error-msg").html "Usuário ou senha inválido."
        $("#username, #password").addClass "error"
      return

  false
