$(document).on "page:load", ->
  autocomplete()
  $("#find_guest").click (event) ->
    $.ajax
      url: "selectGuest"
      type: "GET"
      data:
        data: $("#guests").val()

      success: (data, textStatus, xhr) ->
        document.getElementById("guest_id").value = data.id
        document.getElementById("name").value = data.name
        document.getElementById("accompanying_number").value = data.accompanying_number
        $("#confirm_presence").css display: "block"
        return

      error: (erro) ->
        alert JSON.stringify(erro)
        return

    event.preventDefault()
    return

  $("#btn_confirm").click (event) ->
    $.ajax
      url: "confirmThisGuest"
      type: "post"
      data:
        data: $("#guest_id").val()

      success: (data, textStatus, xhr) ->
        if data is "Salvo"
          $(".hideGuest").css display: "none"
          $("#confirm_presence").css display: "none"
          $("#confirm_msg").css display: "block"
        else
          alert data
        return

      error: (erro) ->
        alert JSON.stringify(erro)
        return

    event.preventDefault()
    return

  return
