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

  # Flat Unit Tests

  
  def setup
    @user = User.new first_name:"Thomas", email: "test@test.fr", password: "azerty"
    @flat = Flat.new(title: "Superbe appartement à Lyon", description: "lorem ipsum dolorat sactus epsum ibidum", user_id: 4, category: "appartement")
    # puts @flat
  end

  test "The user should be valid" do
    puts "---test 1 ----"
    assert @user.valid?
  end


  test "The Flat should have been created successfully" do
    puts "----test 2 ----"
    assert @flat.valid?
  end

  test "The Flat should have a title" do
    puts "-----test 3------"
    @flat.title = ""
    assert_not @flat.valid?
  end

  test "Flat title should be unique" do
    @flat.save
    flat2 = Flat.new(title: "Superbe appartement à Lyon" )
    assert_not flat2.valid?
  end

  test "Title should not be too long" do
    @flat.title = "a" * 101
    assert_not @flat.valid?
  end

  test "Name should not be too short" do
    @flat.title = "abcde"
    assert_not @flat.valid?
  end


end
