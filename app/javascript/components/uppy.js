import Uppy, { XHRUpload, DragDrop } from 'uppy'
import '../src/uppy.css'

const Uppy = require('@uppy/core')
const Dashboard = require('@uppy/dashboard')
const GoogleDrive = require('@uppy/google-drive')
const Dropbox = require('@uppy/dropbox')
const Instagram = require('@uppy/instagram')
const Webcam = require('@uppy/webcam')
const Tus = require('@uppy/tus')

const container = document.querySelector('DashboardContainer')

const uploader = () => {
 if(container){
    const uppy = Uppy({
      debug: true,
      autoProceed: false,
      restrictions: {
        maxFileSize: 1000000,
        maxNumberOfFiles: 3,
        minNumberOfFiles: 2,
        allowedFileTypes: ['image/*', 'video/*']
      }
    })
    .use(Dashboard, {
      trigger: '.UppyModalOpenerBtn',
      inline: true,
      target: '.DashboardContainer',
      replaceTargetContent: true,
      showProgressDetails: true,
      note: 'Images and video only, 2–3 files, up to 1 MB',
      height: 470,
      metaFields: [
        { id: 'name', name: 'Name', placeholder: 'file name' },
        { id: 'caption', name: 'Caption', placeholder: 'describe what the image is about' }
      ],
      browserBackButtonClose: true
    })
    .use(GoogleDrive, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
    .use(Dropbox, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
    .use(Instagram, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
    .use(Webcam, { target: Dashboard })
    .use(Tus, { endpoint: 'https://master.tus.io/files/' })

    uppy.on('complete', result => {
      console.log('successful files:', result.successful)
      console.log('failed files:', result.failed)
    })
  }
}

export default uploader;
