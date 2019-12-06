require 'test_helper'

class ContactRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_request_index_url
    assert_response :success
  end
end
