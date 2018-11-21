require 'test_helper'

class FlatsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create first_name: "Thomas", password: "azerty"
    @flat = Flat.create title: "Superbe appartement à Paris", description: "Lorem Ipsum Montmartre Pancras Doloris", user_id: @user.id
  end

  test "should get flats index" do
    get flats_path
    assert_response :success
  end

  test "should get new" do
    get new_flat_path
    assert_response :success
  end

  test "should get show" do 
    get flat_path, {'id': @flat.id.to_s }
    assert_response :success
  end

  test "should get edit" do 
    get edit_flat_path
    assert_response :success
  end
end
