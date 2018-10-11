class ImageUploader < Shrine
  plugin :determine_mime_type
  plugin :upload_endpoint if Rails.env.development? || Rails.env.test?
  plugin :restore_cached_data

  Attacher.promote { |data| PromoteWorker.perform_later(data) }
  Attacher.delete { |data| DeleteWorker.perform_later(data) }

end
