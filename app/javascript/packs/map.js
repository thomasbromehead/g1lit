var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');

const mapContainer = document.getElementById('map')
console.log(mapContainer)

mapboxgl.accessToken = 'pk.eyJ1IjoidG9tYnJvbSIsImEiOiJjam1zNHI5YWowNnN2M3FvOG53cWZtc2xqIn0.935BRFEIPauYFMLB-Re4tA';

if(mapContainer){
  const feat = []
  if(mapContainer){
    const results = JSON.parse(mapContainer.dataset.markers);
    console.log(results)
    results.forEach(flat => {
    feat.push({
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
            pricePerNight: flat.price_per_night,
            category: flat.category
          }
        })
    })
    console.log(feat)
  }

  const flats = Object.assign({type:"FeatureCollection",
  features:feat})



  const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/tombrom/cjn0pbzh851xg2sqqk9rhb44j',
  center: [2.3488, 48.8534],
  zoom:4.5
  });

  window.map = map;


  map.on('load', function(){
    map.addSource("places",{
        type:'geojson',
        data: flats
    });
    map.addLayer({
      id: 'locations',
      type: 'symbol',
      // Add a GeoJSON source containing place coordinates and information.
      source: {
        type: 'geojson',
        data: flats
      },
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


  const flatCard = document.querySelectorAll('.flat-description--index');
  console.log(flatCard)


    // console.log(element[i].properties.category);  
    // const backgroundImage = el.style.backgroundImage;
    // switch(backgroundImage){
    //   case 
    // }
    // Add markers to the map at all points

  for(flat of flatCard){
    flat.addEventListener('click', function(){
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

  }

  flats.features.forEach(function(marker, i) {
    // Create an img element for the marker
    const el = document.createElement('div');
    el.id = "marker-" + i;
    el.className = 'marker';;
    el.style.backgroundSize = "cover";
    el.style.backgroundRepeat = "none";
    el.style.height = "60px";
    el.style.width = "60px";
    const category = marker.properties.category;
    console.log(map.transform.tileZoom);
    switch(category){
      case "maison":
      el.style.backgroundImage = "url('/assets/markers/marker-maison.png')";
      break;
      case "appartement":
      el.style.backgroundImage = "url('/assets/markers/marker-appart.png')";
      break;
      case "terrain":
      el.style.backgroundImage = "url('/assets/markers/marker-terrain.png')";
      break;
      case "caravane":
      el.style.backgroundImage = "url('/assets/markers/marker-caravane.png')";
      break;
      case "camping-car":
      el.style.backgroundImage = "url('/assets/markers/marker-camper.png')";
      break;
    }
    new mapboxgl.Marker(el, {offset: [0, -23]})
        .setLngLat(marker.geometry.coordinates)
        .addTo(map);
        // console.log(marker.geometry.coordinates)
    el.addEventListener('click', function(e) {
      var activeItem = document.getElementsByClassName('active');
      // 1. Fly to the point
      flyToStore(marker);
      // 2. Close all other popups and display popup for clicked store
      createPopUp(marker);
      // 3. Highlight listing in sidebar (and remove highlight for all other listings)
      e.stopPropagation();
      if (activeItem[0]) {
        activeItem[0].classList.remove('active');
      }
      var listing = document.getElementById(i);
      console.log(listing);
      listing.classList.add('active');
    });   
  });

  map.on('zoom', () => {
    const markers = document.querySelectorAll('.marker');
    console.log(map.getZoom());
    markers.forEach( marker => {
      console.log(marker.style)
      if(map.getZoom() > 5 && map.getZoom() < 8  ){
        marker.style.height = "100px";
        marker.style.width= "100px";
        } else if(map.getZoom() > 8) {
          marker.style.height = "150px";
          marker.style.width= "150px";
        } else {
          marker.style.height = "60px";
          marker.style.width= "60px";
        }
      });
  });

  map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    placeholder: "Chercher un lieu",
    zoom:10,
  }));


  // document.getElementById('geocoder').appendChild(geocoder.onAdd(map));

  map.addControl(new mapboxgl.NavigationControl());
  map.addControl(new mapboxgl.FullscreenControl());

}

