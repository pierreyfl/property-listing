// _TODO refactor this code.

$(document).on("turbolinks:load", function() {
  $('#country').change(function(){
    country = $(this).val();
    console.log(country)
    if(country){
      $.ajax({
        method: 'GET',
        url: '/api/v1/citystates',
        dataType: 'json',
        data: { 'country': country },
        success: function(data){
          var items = [];
          keys = Object.keys(data.states);
          if(keys.length > 0){
            items.push('<option value="0">All States</option>');
            $('#state').prop('disabled', false);
            keys.forEach(function (key){
              items.push('<option value="' + data.states[key] + '">' + key + '</option>');
            });
          }else{
            items.push('<option> No states </option>');
            $('#state').prop('disabled', true);
          }
          $('#state').html(items.join(''));
          $("#state").trigger("chosen:updated");
        },
        statusCode: {
          404: function() {
            alert("There was a problem");
          }
        }
      });
    }else{
      $('#state').html('<option>Select Country First</option>');
    }
  });


  $('#state').change(function(){
    state = $(this).val();
    console.log(state)
    if(state){
      $.ajax({
        method: 'GET',
        url: '/api/v1/citystates',
        dataType: 'json',
        data: { 'state': state },
        success: function(data){
          var items = [];
          cities = data.cities;
          if(cities.length > 0){
            items.push('<option value="0">All Cities</option>');
            $('#city').prop('disabled', false);
            cities.forEach(function (city){
              items.push('<option value="' + city + '">' + city + '</option>');
            });
          }else{
            items.push('<option> No cities </option>');
            $('#city').prop('disabled', true);
          }
          $('#city').html(items.join(''));
          $("#city").trigger("chosen:updated");
        },
        statusCode: {
          404: function() {
            alert("There was a problem");
          }
        }
      });
    }else{
      $('#city').html('<option>Select State First</option>');
    }
  });
});
