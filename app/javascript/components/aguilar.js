
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



