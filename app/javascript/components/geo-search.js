const homeSearch = document.getElementById('home-city-search');
const debounce = require('lodash/debounce');

const geoSearch = () => {
  console.log(homeSearch);
  homeSearch.addEventListener('keyup', debounce((e) => {
    const city = e.target.value
    const fetchUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${city}.json?access_token=pk.eyJ1IjoidG9tYnJvbSIsImEiOiJjam1zNHI5YWowNnN2M3FvOG53cWZtc2xqIn0.935BRFEIPauYFMLB-Re4tA`
    fetch(fetchUrl)
    .then(response => response.json())
    .then(data => console.log(data))
  }, 300))

}

export default geoSearch; 

