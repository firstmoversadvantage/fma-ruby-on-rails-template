require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_index_url
    assert_response :success
  end

  test "should get cookie_policy" do
    get cookie_policy_url
    assert_response :success
  end

end
