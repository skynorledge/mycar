require "test_helper"

class Admin::CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_cars_show_url
    assert_response :success
  end
end
