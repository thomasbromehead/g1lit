import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css';
import 'flatpickr/dist/themes/airbnb.css'

function datepickr() {
  const date = document.querySelector('.dates');
  if (date) {
    console.log("building");
    flatpickr(date,  
      {
        minDate: "today",
        enableTime: true,
        mode: "range",
        minTime: "09:00",
        showAlways: false,
        theme: "light"
      });
  }
}

export { datepickr };
