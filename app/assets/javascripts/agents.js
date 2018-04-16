$(document).ready(function() {
    var form = $('.selectedRegion');
    // replace states select options once country selection change
    $('.countrySelect').on('change', function(){
        $('.stateSelect').empty();
        $('.citySelect').empty();
        form.find('.selectedCountry').val($('.countrySelect').val());
        form.find('.selectedState').val($('.stateSelect').val());
        Rails.fire(form[0], 'submit');
    });

    // replace city select options once state selection change
    $('body').on('change', '.stateSelect', function() {
        $('.citySelect').empty();
        form.find('.selectedCountry').val($('.countrySelect').val());
        form.find('.selectedState').val($('.stateSelect').val());
        Rails.fire(form[0], 'submit');
    })
});

