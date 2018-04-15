$(document).ready(function() {
    var form = $('.selectedRegion');
    $('.countrySelect').on('change', function(){
        $('.stateSelect').empty();
        $('.citySelect').empty();
        form.find('.selectedCountry').val($('.countrySelect').val());
        form.find('.selectedState').val($('.stateSelect').val());
        Rails.fire(form[0], 'submit');
    });
    $('body').on('change', '.stateSelect', function() {
        $('.citySelect').empty();
        form.find('.selectedCountry').val($('.countrySelect').val());
        form.find('.selectedState').val($('.stateSelect').val());
        Rails.fire(form[0], 'submit');
    })
});

