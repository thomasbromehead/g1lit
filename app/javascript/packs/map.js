var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

const mapContainer = document.getElementById('map');
console.log(mapContainer);
const results = JSON.parse(mapContainer.dataset.markers);
console.log(results);
 
mapboxgl.accessToken = 'pk.eyJ1IjoidG9tYnJvbSIsImEiOiJjam1zNHI5YWowNnN2M3FvOG53cWZtc2xqIn0.935BRFEIPauYFMLB-Re4tA';
var map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/mapbox/streets-v10',
center: [2.3488, 48.8534],
zoom:5
});

