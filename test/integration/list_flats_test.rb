require 'test_helper'

class ListFlatsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create first_name:"Thomas", email: "test@test.fr", password: "azerty"
    @flat = Flat.new(title: "Superbe appartement à Lyon", description: "lorem ipsum dolorat sactus epsum ibidum", user_id: @user.id, category: "appartement")
    @flat2 = Flat.new(title: "Superbe maison à Paris", description: "lorem ipsum dolorat sactus epsum ibidum", user_id: @user.id, category: "appartement")
  end

  test "should show categories listing" do
    get flats_path
    assert_template 'flats/index'
    assert_select 'a[href=?]', flat_path(@flat), text: @flat.title
    assert_select 'a[href=?]', flat_path(@flat2), text: @flat2.title
  end

end
