var map;

function addMarkers() {
  var element = document.querySelector("#properties-list");
  var properties = window.properties = JSON.parse(element.dataset.properties);

  map.removeMarkers();
  
  properties.forEach(function (property) {
    if (property.latitude && property.longitude){
        var marker = map.addMarker({
        lat: property.latitude,
        lng: property.longitude,
        title: property.address,
        infoWindow: {
          content: `
          <h5>
            <a href='/properties/${property.id}'>
              ${property.name}
            </a>
          </h5>
          <p>
            ${property.address}
          </p>
          `
        }
      });
    }
  });

  var l = element.dataset.l;
  if(l){
    var latlngs   = l.split(',');
    var southWest = new google.maps.LatLng(latlngs[0], latlngs[1]);
    var northEast = new google.maps.LatLng(latlngs[2], latlngs[3]);
    var bounds    = new google.maps.LatLngBounds(southWest, northEast);
    map.fitBounds(bounds, 0);
  }else{
    map.fitZoom();
  }
}

$(document).on("turbolinks:load", function() {
  var map = window.map = new GMaps({
    el: '#map',
    lat: -12.043333,
    lng: -77.028333
  });

  addMarkers();

  document.querySelector("#redo-search").addEventListener("click", function(e) {
    e.preventDefault();

    var bounds = map.getBounds();
    var location = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();

    Turbolinks.visit(`/properties?l=${location}`);
  });
});
