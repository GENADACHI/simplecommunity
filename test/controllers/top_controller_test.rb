require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_index_url
    assert_response :success
  end

  test "should get login_check" do
    get top_login_check_url
    assert_response :success
  end
end
