$(document).on("turbolinks:load", function() {
  var element = $("#save-search");
  element.click(function () {
    element.html("<i class='fa fa-spinner fa-spin'></i> Saving...")
    element.css("pointer-events", "none")
  });
});
