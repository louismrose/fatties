$.behaviours.add("click", "populate_form", ->
  name   = $(this).data 'name'
  points = $(this).data 'points'

  $('#entry_name').val name
  $('#entry_points').val points

  $('#entry_points').focus() unless userIsOnTouchDevice
)

userIsOnTouchDevice = -> navigator.userAgent.match(/iPod|iPhone|iPad/i)


$.behaviours.add("change", "calculate_points_from_nutritional_information", ->
  # TODO this is domain logic and should probably be on the server side
  # Maybe this function should perform a request to a Calculation model on the server?
  $('#entry_points').val(Math.max(0,
                          Math.round($('#carbohydrate').val() / 9.2105 +
                           $('#protein').val() / 10.9375 +
                           $('#fat').val() / 3.8889 +
                           $('#fibre').val() / 35)
                         ))
)