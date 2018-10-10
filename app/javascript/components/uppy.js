import Uppy from '@uppy/core';
import Dashboard from '@uppy/dashboard';
import GoogleDrive from '@uppy/google-drive';
import Dropbox from '@uppy/dropbox';
import Tus from '@uppy/tus';



const container = document.querySelector('.dashboard-container')

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
      target: container,
      replaceTargetContent: true,
      showProgressDetails: true,
      note: "Pas de limites de taille, c'est pas beau ça?",
      showLinkToFileUploadResult: true,
      height: 470,
      metaFields: [
        { id: 'name', name: 'Nom', placeholder: 'file name' },
        { id: 'caption', name: 'Description', placeholder: 'Ceci est une image de ?' }
      ],
      browserBackButtonClose: true,
      locale: {
        browse: "Choisir",
        edit: "modifier"
      }
    })
    .use(GoogleDrive, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
    .use(Dropbox, { target: Dashboard, serverUrl: 'https://companion.uppy.io' })
    .use(Tus, { endpoint: 'https://master.tus.io/files/' })

    uppy.on('complete', result => {
      console.log('successful files:', result.successful)
      console.log('failed files:', result.failed)
    })
  }
}

export default uploader;
