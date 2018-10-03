var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

const mapContainer = document.getElementById('map');
console.log(mapContainer);
const results = JSON.parse(mapContainer.dataset.markers);
// const georesults = results.forEach(result => {
//   console.log(Object.value(result.lat))
// })

console.log(typeof results);
console.log(results);

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
          pricePerNight: flat.price_per_night,
          postalCode : flat.zip_code
        }
      }
    ]
  });
})

const flats = Object.assign({}, ...d)

const geoflats = JSON.stringify(flats);
console.log(geoflats);

 
mapboxgl.accessToken = 'pk.eyJ1IjoidG9tYnJvbSIsImEiOiJjam1zNHI5YWowNnN2M3FvOG53cWZtc2xqIn0.935BRFEIPauYFMLB-Re4tA';
var map = new mapboxgl.Map({
container: 'map',
style: 'mapbox://styles/mapbox/streets-v10',
center: [2.3488, 48.8534],
zoom:5
});

map.on('load', e => {
  map.addLayer({

  })
})


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
