require "uppy/s3_multipart"

resource = Aws::S3::Resource.new(
  access_key_id:     Rails.application.credentials[:aws][:access_key_id],
  secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
  region:            Rails.application.credentials[:aws][:region],
)

bucket = resource.bucket("g1lit")

UPPY_S3_MULTIPART_APP = Uppy::S3Multipart::App.new(bucket: bucket)
