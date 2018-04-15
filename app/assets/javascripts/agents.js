$(document).ready(function() {
    var form = $('.selectedRegion');
    $('body').on('change', '.countrySelect', function(){
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

    var agentForm = $('#agentForm');
    agentForm.onsubmit = function() {
        alert('on submit');
    }
});

