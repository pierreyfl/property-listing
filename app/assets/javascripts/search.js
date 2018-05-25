$(function () {
  $("#tab-buy").click(function(e) {
    $("#q_is_rent_eq").val('false');
  });

  $("#tab-rent").click(function(e) {
    $("#q_is_rent_eq").val('true');
  });

  if ($("#q_is_rent_eq").val() === '') {
    $("#q_is_rent_eq").val('false');
  }
  $("#autolocation").geocomplete();

  $("#link-more-options").click(function(e) {
    e.preventDefault();
    if ($("#search-more-options").css('display') == 'none') {
      $("#search-more-options").show();
      $(this).find('.fa-angle-down').show();
      $(this).find('.fa-angle-up').hide();
    } else {
      $("#search-more-options").hide();
      $(this).find('.fa-angle-down').hide();
      $(this).find('.fa-angle-up').show();
    }
    return false;
  });
});
