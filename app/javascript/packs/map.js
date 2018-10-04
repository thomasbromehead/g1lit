var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

const mapContainer = document.getElementById('map');
console.log(mapContainer);
const results = JSON.parse(mapContainer.dataset.markers);
// const georesults = results.forEach(result => {
//   console.log(Object.value(result.lat))
// })

// Recursively build a geojson object from our results array
const d = []

results.forEach(flat => {
  d.push({
    type:"FeatureCollection",
    features: [
      {
        type:"Feature",
        geometry: {
          type:"Point",
          coordinates:[
            flat.long,
            flat.lat
          ]
        },
        properties: {
          address: flat.address,
          city: flat.city,
          country: flat.country,
          street: flat.street,
          postalCode : flat.postalCode,
          pricePerNight: flat.price_per_night
        }
      }]
  })
})

const flats = Object.assign({}, ...d)
console.log(flats)
const geoflats = JSON.stringify(flats);

 
mapboxgl.accessToken = 'pk.eyJ1IjoidG9tYnJvbSIsImEiOiJjam1zNHI5YWowNnN2M3FvOG53cWZtc2xqIn0.935BRFEIPauYFMLB-Re4tA';
var map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/mapbox/streets-v9',
center: [2.3488, 48.8534],
zoom:4
});


map.on('load', function(e){
  map.addLayer({
    id: 'locations',
    type: 'symbol',
    source: {
      type:'geojson',
      data: flats
    },
    layout: {
      'icon-image': 'restaurant-15',
      'icon-allow-overlap': true, 
    }
  });
});

function flyToStore(currentFeature) {
  map.flyTo({
    center: currentFeature.geometry.coordinates,
    zoom: 15
  });
}

function createPopUp(currentFeature) {
  var popUps = document.getElementsByClassName('mapboxgl-popup');
  // Check if there is already a popup on the map and if so, remove it
  if (popUps[0]) popUps[0].remove();

  var popup = new mapboxgl.Popup({ closeOnClick: false })
    .setLngLat(currentFeature.geometry.coordinates)
    .setHTML(`<h3>${currentFeature.properties.city}</h3><br/>
      <h4>${currentFeature.properties.address}</h4><br>
      <h4>${currentFeature.properties.price_per_night}</h4>`)
    .addTo(map);
}

const flatCard = document.querySelector('.flat-card');
console.log(flatCard);

flatCard.addEventListener('click', function(e){
  const clickedId = this.id;
  console.log(clickedId);
  const clickedListing = flats.features[clickedId]
  console.log(clickedListing);
  flyToStore(clickedListing);
  createPopUp(clickedListing);
  const activeItem = document.getElementsByClassName('active');
  console.log(activeItem);
  if (activeItem[0]) {
    activeItem[0].classList.remove('active');
  }
  this.classList.add('active');
})

// Add an event listener for when a user clicks on the map
map.on('click', function(e) {
  // Query all the rendered points in the view
  var features = map.queryRenderedFeatures(e.point, { layers: ['locations'] });
  if (features.length) {
    var clickedPoint = features[0];
    // 1. Fly to the point
    flyToStore(clickedPoint);
    // 2. Close all other popups and display popup for clicked store
    createPopUp(clickedPoint);
    console.log(clickedPoint);
    // 3. Highlight listing in sidebar (and remove highlight for all other listings)
    var activeItem = document.getElementsByClassName('active');
    console.log(activeItem);
    if (activeItem[0]) {
      activeItem[0].classList.remove('active');
    }
    // Find the index of the store.features that corresponds to the clickedPoint that fired the event listener
    var selectedFeature = clickedPoint.properties.address;
    console.log(selectedFeature);

    for (var i = 0; i < flats.features.length; i++) {
      if (flats.features[i].properties.address === selectedFeature) {
        console.log(flats.features[i].properties.address);
        selectedFeatureIndex = i;
        console.log(selectedFeatureIndex);
      }
    }
    // Select the correct list item using the found index and add the active class
    var listing = document.getElementById(`${selectedFeatureIndex}`);
    console.log(listing);
    listing.classList.add('active');
  }
});



// const results = [{
//   address: "3 avenue longue",
//   city: "Saint-Junien"
//   },
//   {
//   address:"4 petite avenue",
//   city: "Lens"
//   }]

// function toGeoJson(data){
//   if(data.length == 1){
//     return {
//       type:"FeatureCollection",
//         features:[
//           {
//             type:"Feature",
//             geometry:{
//               type:"Point",
//               coordinates: [data[0].long, data[0].lat]
//             },
//             properties: {
//               address: data[0].address,
//               city: data[0].city,
//               country: data[0].country,
//               postalCode:data[0].postalCode
//             }
//           }
//         ]
//       }
//     } else {
      
//     }
// }
