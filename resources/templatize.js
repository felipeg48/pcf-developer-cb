/* templatize */
$(function() {
  if (typeof(attributes) == "undefined") {
    return;
  }

  var content = $("#content");
  var header = $("#header");
  $("#template").append(content.html());

  var source = $("#template").html();
  var template = Handlebars.compile(source);

  buildForm();

  function buildForm() {
    header.append("<i id='form-trigger' class='fa fa-chevron-down fa-2x' title='Environment'></i>");
    header.append("<form id='thebinding'><fieldset><legend>Environment</legend></fieldset></form>");
    var form = $("#thebinding");

    var fieldset = form.find("fieldset");
    var formFieldTemplate = Handlebars.compile($("#form_field").html());
    for (i=0; i<attributes.length; i++) {
      fieldset.append(formFieldTemplate({name: attributes[i]}));
    }

    var formButtonTemplate = Handlebars.compile($("#form_button").html());
    fieldset.append(formButtonTemplate({}));
    $("#binditBtn").click(function() {
      bind(form2o(form));
      form.toggle(); // "close"
    });

    $("#form-trigger").click(function() {
      form.toggle();
      if (form.is(":visible")) {
        form.find($("input:text:visible:first")).focus();
      }
    });

    $(document).keyup(function(e) {
      if (e.which === 27 && form.is(":visible")) {
        form.toggle();
      }
    });
  }

  function bind(context) {
    content.html(template(context));
    $(".tabs").tabs(); // todo: fire an event, and let tabs.js fend for itself
  }

  function form2o(form) {
    var data = form.serialize();
    var pairs = data.split("&");
    var parts, i, o = {};
    for (i=0; i<pairs.length; i++) {
      parts = pairs[i].split("=");
      o[parts[0]] = unescape(parts[1]);
    }
    return o;
  }
});
