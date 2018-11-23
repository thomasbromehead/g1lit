import TinyPicker from 'tiny-picker';

function pickadate(){
  const startDate = document.getElementById('start');
  const endDate = document.getElementById('end');
  if(startDate && endDate){
    new TinyPicker({
      firstBox:startDate,
      lastBox:endDate,
      local: 'fr-FR',
      days:['Di','Lu','Ma','Me','Je','Ve','Sa']
    }).init();
  }

  const showStart = document.querySelector('.booking-start_date')
  const showEnd = document.querySelector('.booking-end_date')
  if(showStart && showEnd){
    console.log('pick a date on the show page')
    new TinyPicker({
      firstBox:showStart,
      lastBox:showEnd,
      local: 'fr-FR',
      days:['Di','Lu','Ma','Me','Je','Ve','Sa']
    }).init();
  }

}

export { pickadate };
