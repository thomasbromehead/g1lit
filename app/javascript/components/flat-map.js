

mapboxgl.accessToken = 'pk.eyJ1IjoidG9tYnJvbSIsImEiOiJjam1zNHI5YWowNnN2M3FvOG53cWZtc2xqIn0.935BRFEIPauYFMLB-Re4tA';


  function mapFlat(){
    const flatMap = document.getElementById('flat-map')
    const flatDetails = JSON.parse(flatMap.dataset.marker)
    if (flatMap){
      const feat2 = {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [
            flatDetails.long,
            flatDetails.lat
          ]
        },
        properties: {
          category: flatDetails.category
        }
      }
      const map2 = new mapboxgl.Map({
        container: flatMap,
        style: 'mapbox://styles/tombrom/cjn0pbzh851xg2sqqk9rhb44j',
        center: feat2.geometry.coordinates,
        zoom:7.5
      });
    
      (function(){
        const el = document.createElement('div')
        el.className = 'marker';
        el.style.backgroundImage = "url('/assets/markers/marker-appart.png')";
        el.style.backgroundSize = "cover";
        el.style.backgroundRepeat = "none";
        el.style.height = "60px";
        el.style.width = "60px";
        console.log(map2);
        console.log(el)
        new mapboxgl.Marker(el)
        .setLngLat(feat2.geometry.coordinates)
        .addTo(map2)
      })();
    
        map2.on('load', function(){
        map2.addSource("places",{
            type:'geojson',
            data: feat2
        });
        map2.addLayer({
          id: 'locations',
          type: 'symbol',
          source: {
            type: 'geojson',
            data: feat2
          },
        });
      });
      map2.addControl(new mapboxgl.NavigationControl());
      map2.addControl(new mapboxgl.FullscreenControl());
    }
  }
 export default mapFlat;
