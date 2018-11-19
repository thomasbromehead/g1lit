# == Schema Information
#
# Table name: bookings
#
#  id         :bigint(8)        not null, primary key
#  end_date   :datetime
#  nb_nights  :integer
#  price      :integer
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flat_id    :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_bookings_on_flat_id  (flat_id)
#  index_bookings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#

class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "user_id"  
  belongs_to :flat, counter_cache: :nb_of_bookings
  has_one :payment

  validates :nb_of_nights, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0, }

end
