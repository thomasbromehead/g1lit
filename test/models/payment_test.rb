# == Schema Information
#
# Table name: payments
#
#  id         :bigint(8)        not null, primary key
#  amount     :float
#  confirmed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
