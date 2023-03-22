require "test_helper"

class User::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_likes_index_url
    assert_response :success
  end
end
