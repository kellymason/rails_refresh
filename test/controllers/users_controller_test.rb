require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:kelly)
    @user_two = users(:tina)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect index to login page when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@user_two)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@user_two)
    patch user_path(@user), params: { user: { name: @user.name, email: @user.email }}
    assert flash.empty?
    assert_redirected_to root_url
  end

end
