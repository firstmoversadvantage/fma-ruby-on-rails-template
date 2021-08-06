require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get cookie_policy' do
    get cookie_policy_url
    assert_response :success
  end

  test 'should get faq' do
    get faq_url
    assert_response :success
  end

  test 'should get privacy_policy' do
    get privacy_policy_url
    assert_response :success
  end

  test 'should get terms_of_use' do
    get terms_of_use_url
    assert_response :success
  end

  test "wrong path renders not_found" do
    heading = "<h1>The page you&#39;re looking for does not exist.</h1>\n"
    get '/i_do_not_exist'
    assert_response 404
    assert_includes response.body, heading
  end
end
