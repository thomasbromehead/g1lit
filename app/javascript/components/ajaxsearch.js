var _ = require('lodash/');
const flatsList = document.querySelector('#flat-listings')

document.addEventListener('DOMContentLoaded', function(){
  const carte = document.querySelector('.mapboxgl-canvas')
  const formatUrl = (urlStr, params) => urlStr + '?' + new URLSearchParams(_.pickBy(params, _.negate(_.isNil))).toString();
  const dragMap = () => {
    map.on('dragend', (e) => {
      console.log("finished dragging")
      // console.log(map.getCenter())
      const NE = JSON.stringify(map.getBounds()._ne)
      const SW = JSON.stringify(map.getBounds()._sw)
      console.log(NE,SW)
      fetch(formatUrl('/flats', {
        ne: NE,
        sw: SW
      }), {
        method: 'GET',
        headers: {
          'Accept': 'application/javascript'
        }
      })
      .then((res) => {
        let response2 = res.clone()
        console.log('response2=', response2)
        const listings = document.getElementById('flat-listings')
        window.listings = listings
        return eval(res.text())
      })
      .then((response) => {
        console.log('response', response)
        eval(response)
      })
    })
    map.on('zoom', () => {
      console.log(map.getZoom())
      console.log(map.getBounds().getCenter().lat)
    })
    return this;
  }
  dragMap();
})



export default this.dragMap;
