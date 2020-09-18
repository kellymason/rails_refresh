require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Test User",
      email: "michealsbutt@thegreatest.com",
      password: "my_password",
      password_confirmation: "my_password"
      )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51 + "@example.com"
    assert_not @user.valid?    
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "b" * 256 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid formats" do
    valid_addresses = %w[USER@test.com ANOTHER_user@a.test.com first.last@co.uk]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should return error when format is invalid" do
    valid_addresses = %w[a@b+c.com user@test,com user_at_test_com user@test. user@example_dot.com]
    valid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  test "user should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should not be blank" do
    @user.password_confirmation = "   "
    assert_not @user.valid?
  end

  test "password should be at least 8 characters" do
    @user.password_confirmation = "123456"
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
