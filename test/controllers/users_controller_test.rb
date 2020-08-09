require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should not save a user without a password" do
    user = User.new
    user.name = 'name'
    user.email = 'name@test.com'
    assert_not user.save, "Saved the user without a password"
  end
  test "should not save a user without a name" do
    user = User.new
    user.password = 'password'
    user.email = 'name@test.com'
    assert_not user.save, "Saved the user without a name"
  end
  test "should not save a user without an email" do
    user = User.new
    user.password = 'password'
    user.name = 'name'
    assert_not user.save, "Saved the user without an email"
  end
end
