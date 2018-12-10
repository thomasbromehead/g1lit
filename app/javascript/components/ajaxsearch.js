var _ = require('lodash/');

document.addEventListener('DOMContentLoaded', function(){
  const carte = document.querySelector('.mapboxgl-canvas')
  const formatUrl = (urlStr, params) => urlStr + '?' + new URLSearchParams(_.pickBy(params, _.negate(_.isNil))).toString();
  const dragMap = () => {
    console.log(carte);
    map.on('dragend', (e) => {
      console.log("finished dragging")
      // console.log(map.getCenter())
      const NE = JSON.stringify(map.getBounds()._ne)
      const SW = JSON.stringify(map.getBounds()._sw)
      console.log(NE,SW)
      fetch(formatUrl('http://localhost:3000/flats', {
        ne: NE,
        sw: SW
      })
      )
      debugger;
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
