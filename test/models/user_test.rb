require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'correctly creates user with username, encrypts email' do
    user_params = {
      username: 'test',
      email: 'test@test.com',
      password: 'password'
     }

    assert_difference('User.count') do
      User.create(user_params)
    end

    user = User.find_by(username: 'test')
    assert_equal user.email, 'test@test.com'
    assert_equal user.username, 'test'
    assert_equal user.email_encrypted, '2Vt/b0vDKcerRISbXQAsYg=='
  end
end
