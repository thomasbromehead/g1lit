import "bootstrap";
import "../components/aguilar";
// import jQuery from "jquery";
// import $ from "jquery";
// window.$ = window.jQuery = jQuery;
import '../components/slider';


// import initUpdateNavbarOnScroll from '../components/navbar';
// initUpdateNavbarOnScroll();

import bounce from "../components/aguilar"
bounce(); 

// import test from '../components/slider'
// test();

import mapFlat from "../components/flat-map"
const flatMap = document.querySelector("#flat-map")
if(flatMap){
  mapFlat();
  console.log('hello from application.js')
}

// import fileUpload from '../components/uppy';
// fileUpload();


// import { hello } from "../components/hello";
// hello();

if(document.getElementById('results')){
  import glideSlider from '../components/glide';
  glideSlider();
})


import { pickadate } from '../components/pickadate';
pickadate();

// import drift from '../components/zoom';
// drift();


import sweetAlertOnClick from "../components/sweetalert";
// sweetAlertOnClick();

