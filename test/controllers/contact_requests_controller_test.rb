require 'test_helper'

class ContactRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = create(:user)
    @admin = create(:user, :admin)
    @contact_us_params = {
      contact_request: {
        name: 'Test Name',
        email_address: 'test@test.com',
        telephone: '123456789'
      }
    }
  end

  describe 'not admin user' do
    test 'redirects when non admin is logged in' do
      sign_in @user
      get contact_requests_path
      assert_redirected_to root_path + '?locale=en'
    end
  end

  describe 'admin' do
    test 'gets index when admin is logged in' do
      sign_in @admin
      get contact_requests_path
      assert_response :success
    end
  end

  describe 'no user' do
    test 'gets contact_us' do
      get '/contact-us'
      assert_response :success
    end

    test 'creates contact request with correct params' do
      assert_difference('ContactRequest.count') do
        post '/contact-us', params: @contact_us_params
      end
      assert_response :redirect
    end

    test 'does not create contact request with name longer than 20 characters' do
      @contact_us_params[:contact_request][:name] = Faker::Internet.username(specifier: 21)

      assert_no_difference('ContactRequest.count') do
        post '/contact-us', params: @contact_us_params
        assert_response :success
      end
    end

    test 'does not create contact request with empty email' do
      @contact_us_params[:contact_request][:email_address] = ''
      assert_no_difference('ContactRequest.count') do
        post '/contact-us', params: @contact_us_params
        assert_response :success
      end
    end

    test 'does not create contact request with email longer than 50 characters' do
      @contact_us_params[:contact_request][:email_address] = Faker::Internet.email(
        name: Faker::Internet.username(specifier: 50),
        separators: '_'
      )
      assert_no_difference('ContactRequest.count') do
        post '/contact-us', params: @contact_us_params
        assert_response :success
      end
    end

    test 'does not create contact request with email in wrong format' do
      @contact_us_params[:contact_request][:email_address] = 'wrong_email_format.com'
      assert_no_difference('ContactRequest.count') do
        post '/contact-us', params: @contact_us_params
        assert_response :success
      end
    end

    test 'does not create contact request with comments longer than 500 chars' do
      @contact_us_params[:contact_request][:comments] = Faker::Lorem.characters(number: 501)
      assert_no_difference('ContactRequest.count') do
        post '/contact-us', params: @contact_us_params
        assert_response :success
      end
    end

    test 'sends email to admins' do
      assert_difference('ActionMailer::Base.deliveries.count') do
        post '/contact-us', params: @contact_us_params
      end
    end
  end
end
