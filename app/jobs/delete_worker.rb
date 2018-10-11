class DeleteWorker < ActiveJob::Base
  def perform(data)
    Shrine::Attacher.delete(data)
  end
end

