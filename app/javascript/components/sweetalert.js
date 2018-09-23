import swal from 'sweetalert';

const sweetAlertOnClick = () => {
  console.log("hello from sweet alert");
  const button = document.getElementById("hello");
  if (button){
    button.addEventListener('click', () => {
      console.log("yo")
      swal({
        // pass in the sweet alert option
        title:"You are dumb!"
      })
    })
  }
}

export default sweetAlertOnClick;
