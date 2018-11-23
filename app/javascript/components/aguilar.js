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

const cardHover = (cards) => {
      cards.forEach(card => card.addEventListener('mouseover', debounce(() => {
        const cardId = card.getAttribute('id')
        debounce(() => console.log(cardId), 500);
        const marker = document.getElementById(`marker-${cardId}`)
        marker.classList.toggle('hatch');
      }, 200))
    )};

export { bounce, cardHover };
