require "test_helper"

class User::CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_cars_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_cars_edit_url
    assert_response :success
  end

  test "should get index" do
    get user_cars_index_url
    assert_response :success
  end

  test "should get show" do
    get user_cars_show_url
    assert_response :success
  end
end
