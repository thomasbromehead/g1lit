
const searchButton = document.getElementById('home-search-btn');
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
   },3000)
  }
}
