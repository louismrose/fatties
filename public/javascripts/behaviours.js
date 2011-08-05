// Taken from http://weblog.jamisbuck.org/2010/3/2/unobtrusive-yet-explicit
var Behaviours = {
  add: function(trigger, behaviour, handler) {
    document.observe(trigger, function(event) {
      var element = event.findElement("*[data-behaviours~=" + behaviour + "]");
      if (element) handler(element, event);
    });
  }
};

Behaviours.add("click", "populate_form", function(element, event) {
  $('entry_name').value   = element.readAttribute('data-name');
  $('entry_points').value = element.readAttribute('data-points');

  if(!userIsOnTouchDevice()) {
    $('entry_points').focus();
  }
});

Behaviours.add("click", "open_tracker", function(element, event) {
  window.location = element.getElementsBySelector('a');
});


function userIsOnTouchDevice() {
  return navigator.userAgent.match(/iPod|iPhone|iPad/i);
}