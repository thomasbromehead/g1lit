document.addEventListener('DOMContentLoaded', function(){
  const carte = document.querySelector('.mapboxgl-canvas')
  const dragMap = () => {
    console.log(carte);
    map.on('dragend', (e) => {
      console.log("finished dragging")
      // console.log(map.getCenter())
      console.log(map.getZoom())
      map.getBounds()
      const NE = JSON.stringify(map.getBounds()._ne)
      const SW = JSON.stringify(map.getBounds()._sw)
      console.log(NE,SW)
      // fetch(`http://localhost:3000/flats?ne=${NE}&sw=${SW}`)
      // .then(console.log(response))
      fetch(`http://localhost:3000/flats?ne=${NE}&sw=${SW}`)
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
