require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  fixtures :users

  setup do
    @contact_us_params = {
      contact_request: {
        name: 'Test Name',
        email_address: 'test@test.com',
        telephone: '123456789'
      }
    }

    admin_one = User.find_by(username: 'AdminOne')
    admin_one.email = 'admin_one@fma_template.com'
    admin_one.save
  end
  
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get cookie_policy" do
    get cookie_policy_url
    assert_response :success
  end

  test "should get faq" do
    get faq_url
    assert_response :success
  end

  test "should get privacy_policy" do
    get privacy_policy_url
    assert_response :success
  end

  test "should get terms_of_use" do
    get terms_of_use_url
    assert_response :success
  end

  test "should get contact_us" do
    get contact_us_url
    assert_response :success
  end

  test "should post contact_us and save information about customer request" do
    assert_difference('ContactRequest.count') do 
      post contact_us_url, params: @contact_us_params
    end
    assert_response :success
  end

  test 'should send email to admins' do
    assert_difference('ActionMailer::Base.deliveries.count') do
      post contact_us_url, params: @contact_us_params
    end
  end
end
