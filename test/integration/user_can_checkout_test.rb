require "test_helper"

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  def checkout
    trip = create_trip(@city)
    visit city_trips_path(@city)
    click_link "Add to Cart"
    visit cart_path
    click_link "Checkout"
  end

  test "visitor cannot checkout" do
    create_city
    checkout

    assert_equal login_path, current_path
    assert page.has_content? "Please log in before checking out."
  end

  test "user with cart can check out" do
    user_creates_account
    user_logs_in(@user)
    create_city
    checkout

    assert page.has_content? "My Trips (0)"
    assert_equal orders_path, current_path
    assert page.has_content? "Order was successfully placed"

    order = Order.all.first
    within ".orders" do
      click_link "Order #{order.id}"
    end

    assert page.has_content? "Vail"
    assert page.has_content? "Outdoor fun"
    assert page.has_content? "$100"
  end
end
