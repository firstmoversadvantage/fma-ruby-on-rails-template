require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user_params = {
      username: 'test',
      email: 'test@test.com',
      password: 'password'
    }
  end

  describe '.create' do
    test 'correctly creates user with username, encrypts email, creates hash' do
      assert_difference('User.count') do
        create :user, @user_params
      end

      user = User.find_by(username: 'test')
      assert_equal user.username, 'test'
      refute_equal @user_params[:email], user.email_encrypted
      assert_equal user.email_hash, Digest::SHA256.hexdigest(@user_params[:email])
    end
  end

  describe '.search_by_email_hash' do
    test 'looks for user with encrypted email' do
      create :user, @user_params

      user = User.search_by_email_hash(@user_params[:email])
      assert_equal user.email, 'test@test.com'
    end
  end
end
