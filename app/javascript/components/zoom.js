import Drift from 'drift-zoom';

const carouselImage = document.querySelectorAll('.zoomable');
console.log(carouselImage);

function drift(){
  if(carouselImage){
    carouselImage.forEach(element =>{
      new Drift(element, {
        paneContainer: document.getElementById('zoomPane'),
        inlinePane: false,
        onShow: function(){ console.log("tu me zoomes")}
      })
    })
  }
}

export default drift;
