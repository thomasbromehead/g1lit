require "shrine"
require "shrine/storage/url"

if Rails.env.development?
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
    
  }
  Shrine.storages[:cache_url] = Shrine::Storage::Url.new

elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
  Shrine.storages[:cache_url] = Shrine::Storage::Url.new

else
  require "shrine/storage/s3"
  s3_options = {
    access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
    secret_access_key: Rails.application.credential(:aws, :secret_access_key),
    region:            Rails.application.credentials(:aws, :region),
    bucket:            Rails.application.credentials(:aws, :bucket)
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }
  Shrine.storages[:cache_url] = Shrine::Storage::Url.new

end

Shrine.plugin :activerecord
Shrine.plugin :presign_endpoint
Shrine.plugin :backgrounding

