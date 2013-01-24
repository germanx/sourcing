# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
  $('a#add_another_attachment').click(->
    url = "/attachments/new?number=" + $('#attachments input').length
    $.get(url,
      (data)->
        $('#attachments').append(data)
    )
  )
)