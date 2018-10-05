import TinyPicker from 'tiny-picker';

function pickadate(){
  const startDate = document.getElementById('start');
  const endDate = document.getElementById('end');
  console.log(startDate);
  if(startDate && endDate){
    new TinyPicker({
      firstBox:startDate,
      lastBox:endDate,
      local: 'fr-FR'
    }).init();
  }
}

export { pickadate };
