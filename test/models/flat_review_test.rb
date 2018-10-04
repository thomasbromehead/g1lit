# == Schema Information
#
# Table name: flat_reviews
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flat_id    :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_flat_reviews_on_flat_id  (flat_id)
#  index_flat_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class FlatReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
