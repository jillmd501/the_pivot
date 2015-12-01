require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_user
    User.create(username: "user",
             password: "password")

  end

  test "it is valid" do
    assert valid_user.valid?
  end

  test "it is invalid without a username" do
    user = valid_user
    user.username = nil

    refute user.valid?
  end

  test "it is invalid with a duplicate username" do
  	user = valid_user
    user_two = User.new(username: "user",
    									  password: "whatever")

    assert user.valid?
    refute user_two.valid?
  end

  test "it is invalid without a password" do
    user = valid_user
    user.password = nil

    refute user.valid?
  end

end
