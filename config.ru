# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

map "/s3" do
  run UPPY_S3_MULTIPART_APP
end

run Rails.application
