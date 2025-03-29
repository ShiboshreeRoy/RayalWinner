require "test_helper"

class YourProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get your_profile_index_url
    assert_response :success
  end
end
