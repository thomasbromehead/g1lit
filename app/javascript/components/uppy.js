const Uppy = require('@uppy/core')
const XHRUpload = require('@uppy/xhr-upload')
const Dashboard = require('@uppy/dashboard')

const uppy = Uppy()
  .use(Dashboard, {
    trigger: '#select-files'
  })
  .use(XHRUpload, { endpoint: 'https://api2.transloadit.com' })

uppy.on('complete', (result) => {
  console.log(`Upload complete! We’ve uploaded these files: ${result.successful}`)
})
