var debounce = require('lodash/debounce');
console.log(debounce)

const searchButton = document.getElementById('home-search-btn');

// Do this to protect the webpack compilation, otherwise it will look for a searchbutton and try to find its class attribute everywhere, sometimes breaking up the pipeline.



  if(searchButton){
    const classes = searchButton.getAttribute('class');
    const classesArray = classes.split(" ");
    const classPresent = classesArray.includes("slideUp")
    document.onreadystatechange = () => {
      if(document.readyState == "complete"){
          setInterval(()=>{
           if(classPresent){
             searchButton.classList.remove('slideUp');
             setTimeout(()=>{
               searchButton.classList.add('slideUp');
             },1200);
           } 
          },6000)
      }
    }
  }

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
