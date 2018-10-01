class Message < ApplicationRecord
  belongs_to :user,  counter_cache: true, dependent: :destroy
  default_scope {order created_at: :desc}


  def read?
    @read = message.read
  end

  def mark_as_read!
    message.read = true
  end

end
