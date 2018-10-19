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
}

export { pickadate };
