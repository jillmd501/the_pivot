require "test_helper"

class UserTest < ActiveSupport::TestCase
  def valid_user
    User.new(username: "Marlo",
             password: "password")
  end

  def new_order
    Order.new(total: 300)
  end

  test "it is valid" do
    assert valid_user.valid?
  end

  test "it is invalid without a username" do
    user = valid_user
    user.username = nil

    refute user.valid?
  end

  test "it is invalid without a password" do
    user = valid_user
    user.password = nil

    refute user.valid?
  end

  test "it has orders" do
    user = valid_user
    user.orders << new_order

    assert_equal new_order.total, user.orders.first.total
  end
end
