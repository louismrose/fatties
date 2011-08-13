$.behaviours.add("click", "populate_form", function() {
  $('#entry_name').val($(this).attr('data-name'));
  $('#entry_points').val($(this).attr('data-points'));

  if(!userIsOnTouchDevice()) {
    $('#entry_points').focus();
  }
});

function userIsOnTouchDevice() {
  return navigator.userAgent.match(/iPod|iPhone|iPad/i);
}

$.behaviours.add("change", "calculate_points_from_nutritional_information", function(element, event) {
  // TODO this is domain logic and should probably be on the server side
  // Maybe this function should perform a request to a Calculation model on the server?
  $('#entry_points').val(Math.max(0,
                          Math.round($('#carbohydrate').val() / 9.2105 +
                           $('#protein').val() / 10.9375 +
                           $('#fat').val() / 3.8889 +
                           $('#fibre').val() / 35)
                         ));
});