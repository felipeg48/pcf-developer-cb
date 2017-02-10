$(function() {
  var classname = $(".tabs").data("for");
  var stuff = $("."+classname).detach();
  $(".tabs").append(stuff);
  $(".tabs").tabs();
});
