import { link } from 'fs';

const homeSearch = document.getElementById('home-city-search');

const debounce = require('lodash/debounce');

const geoSearch = () => {
  console.log(homeSearch);
  homeSearch.addEventListener('keydown', debounce((e) => {
    const city = e.target.value
    console.log(city);
    const fetchUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${city}.json?access_token=pk.eyJ1IjoidG9tYnJvbSIsImEiOiJjam1zNHI5YWowNnN2M3FvOG53cWZtc2xqIn0.935BRFEIPauYFMLB-Re4tA`
    fetch(fetchUrl)
    .then(response => response.json())
    .then(data => {
      const searchResults = document.getElementById('search-results')
      const features = data.features
      searchResults.innerHTML = ""
      searchResults.style.display = "block"
      const searchBox = document.querySelector('.search-container')
      const searchBoxHeight = searchBox.offsetHeight
      console.log(searchBoxHeight)
      console.log(features.slice(0,5))
      features.slice(0,5).forEach(feature => {
        console.log(feature.place_name);
        const resultItem = document.createElement('li')
        resultItem.style.marginTop = "0.5em"
        resultItem.setAttribute('class','searchItem')
        resultItem.innerText = feature.place_name
        searchResults.appendChild(resultItem)
        resultItem.addEventListener('click', () => {
          console.log(resultItem.innerHTML)
          homeSearch.value = resultItem.innerText;
          console.log(homeSearch.value)
          searchResults.style.display = "none"
        })
      })
      searchResults.style.setProperty("top", `${searchBoxHeight}px`)
      console.log(searchResults.style["top"])
    })
    }, 400))

    
}

export default geoSearch; 

