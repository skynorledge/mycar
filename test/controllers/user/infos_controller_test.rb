require "test_helper"

class User::InfosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_infos_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_infos_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get user_infos_confirm_url
    assert_response :success
  end

  test "should get withdrawal" do
    get user_infos_withdrawal_url
    assert_response :success
  end
end
