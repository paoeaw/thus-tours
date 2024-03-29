import mapboxgl from 'mapbox-gl';

import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      new mapboxgl.Marker({
        color: '#FFC659'
      })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    map.addControl(new mapboxgl.GeolocateControl({
      fitBoundsOptions: {
        maxZoom: 10
      },
      positionOptions: {
        enableHighAccuracy: true
      },
      showUserLocation: true,
      trackUserLocation: true
    }));
    map.geolocate
  }
};

export { initMapbox };


// const clickGeolocator = () => {
//   if (document.querySelector(".mapboxgl-ctrl-geolocate")) {
//     document.querySelector(".mapboxgl-ctrl-geolocate").click();
//   }
// }

// export { clickGeolocator };
