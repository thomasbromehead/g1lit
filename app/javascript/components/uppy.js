
// import '../src/uppy.css'
// import Uppy from 'uppy/core'
// import Dashboard from "uppy/dashboard"
// import GoogleDrive from "uppy/google-drive"
// import Dropbox from "uppy/dropbox"
// import Tus from "uppy/tus"


// function fileUpload(fileInput){
//   const imagePreview = document.querySelector('.image-preview');
//   if(container){
//     fileInput.style.display = "none" 
//     console.log("uppy here");
//       const uppy = Uppy({
//         debug: true,
//         autoProceed: false,
//         restrictions: {
//           maxFileSize: 1000000,
//           maxNumberOfFiles: 3,
//           minNumberOfFiles: 2,
//           allowedFileTypes: ['image/*', 'video/*']
//         }
//       })
//       .use(Dashboard, {
//         trigger: '.UppyModalOpenerBtn',
//         inline: true,
//         target: fileInput.parentNode,
//         replaceTargetContent: true,
//         showProgressDetails: true,
//         note: 'Images and video only, 2–3 files, up to 1 MB',
//         height: 470,
//         metaFields: [
//           { id: 'name', name: 'Name', placeholder: 'file name' },
//           { id: 'caption', name: 'Caption', placeholder: 'describe what the image is about' }
//         ],
//         browserBackButtonClose: true
//       })
//       .use(GoogleDrive, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
//       .use(Dropbox, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
//       .use(Instagram, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
//       .use(Webcam, { target: Dashboard })
//       .use(Tus, { endpoint: 'https://master.tus.io/files/' })

//       uppy.on('upload-success', function (file, data) {
//         // show image preview
//         imagePreview.src = URL.createObjectURL(file.data)
    
//         // construct uploaded file data in the format that Shrine expects
//         var uploadedFileData = JSON.stringify({
//           id: file.meta['key'].match(/^cache\/(.+)/)[1], // object key without prefix
//           storage: 'cache',
//           metadata: {
//             size:      file.size,
//             filename:  file.name,
//             mime_type: file.type,
//           }
//         })

//         var hiddenInput = fileInput.parentNode.querySelector('.upload-hidden')
//         hiddenInput.value = uploadedFileData
//     }
//   ,
// return uppy
// }

// export { fileUpload };
