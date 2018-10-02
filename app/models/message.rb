# == Schema Information
#
# Table name: messages
#
#  id         :bigint(8)        not null, primary key
#  content    :string
#  read       :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
