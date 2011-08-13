$.behaviours.add("click", "open_tracker", ->
  window.location = $('a', this).attr 'href'
)