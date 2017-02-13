$(function() {
  var tabs = $(".tabs");
  $.each(tabs, function() {
    var tabElement = $(this);
    var tabname = tabElement.data("for");
    var tabcontents = $("."+tabname).detach();
    tabElement.append(tabcontents);
  });
  tabs.tabs();
});
