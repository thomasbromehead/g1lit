// import '@glidejs/glide/dist/css/glide.core.css'
// import '@glidejs/glide/dist/css/glide.theme.css'

import Glide from '@glidejs/glide'

function glideSlider(){
  const glideSliders = document.querySelectorAll('.glide')
    if(glideSliders){
      console.log(glideSliders)
      glideSliders.forEach(element => {
        new Glide(element, {
            type: 'carousel',
            perView: 1,
          })
        .mount(
        )
      })
    }
  }
  
export default glideSlider;
