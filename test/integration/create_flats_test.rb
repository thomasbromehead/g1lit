require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  # Have to modify this, id not being passed in properly.


  test "get new flat form and create flat" do
    get new_flat_path
    assert_template 'flats/new'
    assert_difference 'Flat.count', 1 do
      @user = User.create first_name: "Thomas", password: "azerty"
      post flats_path, params: {flat: {title: "Just a random title", description: "Just a random description", user_id: @user.id}}
    end
    follow_redirect!
    assert_match "Just a random title", response.body
  end  

  test "invalid flat submission results in failure" do
    get new_flat_path
    assert_template 'flats/new'
    assert_no_difference 'Flat.count' do
      @user = User.create first_name: "Thomas", password: "azerty"
      post flats_path, params: {flat: {title: "", description: "Just a random description", user_id: @user.id}}
    end
    assert_template 'flats/new'
    # Look for something in the DOM which should be the error messages
    assert_select  'h2.className'

  end 


end
