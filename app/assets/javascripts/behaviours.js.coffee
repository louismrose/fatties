# Based on the Prototype version from http://weblog.jamisbuck.org/2010/3/2/unobtrusive-yet-explicit
$.behaviours =
  add: (trigger, behavior, handler) -> 
         $('[data-behaviours~=' + behavior + ']').live(trigger, handler);