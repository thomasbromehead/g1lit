require "shrine"
require "shrine/storage/s3"

s3_options = {
  bucket:            Rails.application.credentials[:aws][:bucket], # required
  access_key_id:     Rails.application.credentials[:aws][:access_key_id],
  secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
  region:            Rails.application.credentials[:aws][:region],
}

Shrine.plugin :activerecord
Shrine.plugin :presign_endpoint, presign_options: { method: :put }
Shrine.plugin :presign_endpoint, presign_options: -> (request) {
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition:    "inline; filename=\"#{filename}\"", # set download filename
    content_type:           type,                               # set content type (defaults to "application/octet-stream")
    content_length_range:   0..(10*1024*1024),                  # limit upload size to 10 MB
  }
}
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options),
}


