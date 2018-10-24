var debounce = require('lodash/debounce');

const searchButton = document.getElementById('home-search-btn');

// Do this to protect the webpack compilation, otherwise it will look for a searchbutton and try to find its class attribute everywhere, sometimes breaking up the pipeline.


const bounce = () => {
  if(searchButton){
    const classes = searchButton.getAttribute('class');
    const classesArray = classes.split(" ");
    const classPresent = classesArray.includes("slideUp")
    document.onreadystatechange = () => {
      if(document.readyState == "complete"){
        if(classPresent){
            console.log("toggle")
            console.log(this);
            setInterval(()=>{
            searchButton.classList.toggle('slideUp');
             }, 4000)
          }
        }
      }
    }
}

searchButton.addEventListener('mouseover', clearInterval(bounce))
console.log("yo")

export default bounce

  // Need to find out how to transition on SVGs

  // const cards = document.querySelectorAll('.flat-card--index')

  // if(cards){
  //   (function(){
  //     console.log(cards)
  //     cards.forEach(card => card.addEventListener('mouseover', debounce(() => {
  //       const cardId = card.getAttribute('id')
  //       console.log(cardId)
  //       const marker = document.getElementById(`marker-${cardId}`)
  //       console.log(marker);
  //       marker.style.height = "200px"
  //     }, 200))
  //     )}
  //   )();
  //   }
