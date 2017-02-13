/* copy to clipboard */
$(function() {
  var button = $("<button class='c2cb-trigger'><i class='fa fa-clipboard' title='Copy to clipboard'></i></button>")
  $(".listingblock > .content pre").append(button);

  // TODO:  there is currently a bug where the assumption is that all listing blocks are source code.
  // the code looks for a code sibling, which may not always be there
  var clipboard = new Clipboard('.c2cb-trigger', {
    target: function(trigger) {
      return $(trigger).siblings("code")[0];
    }
  });
  clipboard.on('success', function(e) {
    e.clearSelection();
  });
  // TODO: echo a "Copied!" tooltip after the action takes place

});
