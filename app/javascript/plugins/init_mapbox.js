import mapboxgl from 'mapbox-gl';

const buildMap = () => {
  const mapElement = document.getElementById('map');
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
<<<<<<< HEAD
    style: 'mapbox://styles/alevek/ckhz7edm5126619pgecd76492'
=======
    style: 'mapbox://styles/alevek/ckhz8a6k92jdc19p9ci2jqclb'
>>>>>>> 18dc29a170e9844d1cd22fd4e3a006b3b203969b
  });
};


const addMarkersToMap = (map, markers) => {
  console.log("add markers");
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const markerBis = new mapboxgl.Marker({color: "#4B154A"})
    .setLngLat([ marker.lng, marker.lat ])
    .setPopup(popup) // add this
    .addTo(map);

    markerBis._element.setAttribute("id", `card-${marker.cardId}`);
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

const droneCards = document.querySelectorAll(".hover-card");
droneCards.forEach((droneCard)=> {
  droneCard.addEventListener('mouseenter', (event)=> {

    const marker_hov = document.querySelector(`#${event.currentTarget.dataset.cardid}`);
    marker_hov.click();
    console.log(marker_hov);

  });
  droneCard.addEventListener('mouseleave', (event)=> {

    const marker_hov_out = document.querySelector(`#${event.currentTarget.dataset.cardid}`);

    marker_hov_out.click();

  });
});

export { initMapbox };
