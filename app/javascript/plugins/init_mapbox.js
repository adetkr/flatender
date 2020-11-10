import mapboxgl from 'mapbox-gl';

const buildMap = () => {
  const mapElement = document.getElementById('map');
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};



const addMarkersToMap = (map, markers) => {
  console.log("add markers");
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker({color: "#4B154A"})
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup) // add this
    .addTo(map);

  });
};


const fitMapToMarkers = (map, markers) => {
  console.log("fit");
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    if (markers.length > 0) {
      fitMapToMarkers(map, markers);
    }
  }
};

export { initMapbox };
