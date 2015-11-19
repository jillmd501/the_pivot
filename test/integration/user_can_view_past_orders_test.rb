require "test_helper"

class UserCanViewPastTrips < ActionDispatch::IntegrationTest
  test "user can view past trips" do
    user_creates_account
    user_logs_in(@user)
    user_orders_trips(@user)

    visit orders_path

    assert page.has_content? "My Orders"
    assert page.has_link? "Order #{@order.id}"
  end
end
