# == Schema Information
#
# Table name: flats
#
#  id              :bigint(8)        not null, primary key
#  animals         :boolean
#  booked          :boolean          default(FALSE), not null
#  category        :string
#  city            :string
#  country         :string
#  description     :text
#  equipments      :text
#  image_data      :text
#  latitude        :float
#  longitude       :float
#  nb_beds         :integer
#  nb_of_bathrooms :integer
#  nb_of_bookings  :integer          default(0), not null
#  nb_of_reviews   :integer          default(0), not null
#  nb_rooms        :integer
#  price_per_night :integer
#  smoking         :boolean
#  street          :string
#  title           :string
#  zip_code        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
#
# Indexes
#
#  index_flats_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class FlatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
