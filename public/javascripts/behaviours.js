// Taken from http://weblog.jamisbuck.org/2010/3/2/unobtrusive-yet-explicit
var Behaviours = {
  onClick: function(behaviour, handler) {
    document.observe("click", function(event) {
      var element = event.findElement("*[data-behaviours~=" + behaviour + "]");
      if (element) handler(element, event);
    });
  },
  
  // I added this more generic function. It works for blur and focus,
  // but not for click, and I'm not sure why
  // Maybe I can fix this when moving to JQuery...
  on: function(trigger, behaviour, handler) {
    Event.observe(window, 'load', function(event) {
      var elements = $$("*[data-behaviours~=" + behaviour + "]");
      if (elements) elements.forEach(function(element) {
        element.observe(trigger, handler);
      });
    });
  }
};



Behaviours.onClick("populate_form", function(element, event) {
  $('entry_name').value   = element.readAttribute('data-name');
  $('entry_points').value = element.readAttribute('data-points');

  if(!userIsOnTouchDevice()) {
    $('entry_points').focus();
  }
});

Behaviours.onClick("open_tracker", function(element, event) {
  window.location = element.getElementsBySelector('a');
});

Behaviours.on("blur", "calculate_points_from_nutritional_information", function(element, event) {
  // TODO this is domain logic and should probably be on the server side
  // Maybe this function should perform a request to a Calculation model on the server?
  $('entry_points').value = [0,
                             ($('carbohydrate').value / 9.2105 +
                              $('protein').value / 10.9375 +
                              $('fat').value / 3.8889 +
                              $('fibre').value / 35).round()
                            ].max();
});

function userIsOnTouchDevice() {
  return navigator.userAgent.match(/iPod|iPhone|iPad/i);
}