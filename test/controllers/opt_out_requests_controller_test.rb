require 'test_helper'

class ContactRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = create(:user)
    @admin = create(:user, :admin)
    @opt_out_params = {
      opt_out_request: {
        name: 'John Doe',
        request_type: 'opt_out',
        street_address: '2575 Pearl St, Ste 230',
        city: 'Boulder',
        postal_code: '80302',
        state: 'CO'
      }
    }
  end

  describe 'not admin user' do
    # test 'should redirect when non admin is logged in' do
    #   sign_in @user
    #   get opt_out_requests_path
    #   assert_redirected_to root_path + '?locale=en'
    # end
  end

  describe 'admin' do
    # test 'should get index when admin is logged in' do
    #   sign_in @admin
    #   get opt_out_requests_path
    #   assert_response :success
    # end
  end

  describe 'no user' do
    test 'gets opt_out form' do
      get '/opt-out-requests/new'
      assert_response :success
    end

    test 'creates opt-out request with correct params' do
      assert_difference('OptOutRequest.count') do
        post '/opt-out-requests', params: @opt_out_params
      end
      assert_response :redirect
    end

    test 'does not create opt-out request with incorrect params' do
      @opt_out_params[:opt_out_request][:state] = 'incorrect'
      assert_no_difference('OptOutRequest.count') do
        post '/opt-out-requests', params: @opt_out_params
        assert_response :success
      end
    end
  end
end
