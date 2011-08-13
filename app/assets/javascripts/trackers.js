$.behaviours.add("click", "open_tracker", function(element, event) {
  window.location = $('a', this).attr('href');
});