document.addEventListener('DOMContentLoaded', function(){
  const carte = document.querySelector('.mapboxgl-canvas')
  const dragMap = () => {
    console.log(carte);
    // carte.addEventListener("click", () => {
    //   console.log("finished dragging that map")
    // })
    map.on('dragend', () => {
      console.log("finished dragging")
    })
    return this;
  }
  dragMap();
})



export default this.dragMap;
