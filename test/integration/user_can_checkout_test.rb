require "test_helper"

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  test "visitor cannot checkout" do
    visit cart_path
    click_link "Checkout"

    assert_equal login_path, current_path
    assert page.has_content? "Please log in before checking out."
  end

  test "user with cart can check out" do
    user_creates_account
    user_logs_in
    city = City.create(name: "Vail",
                       image_path: "vail.jpg")
    trip = Trip.create(name: "Outdoor Adventure",
                       price: 50,
                       city_id: city.id,
                       description: "Wow!",
                       image_path: "outdoors.jpg")

    visit city_trips_path(city)
    click_link "Add to Cart"
    visit cart_path
    click_link "Checkout"

    assert page.has_content? "My Trips (0)"
    assert_equal orders_path, current_path
    assert page.has_content? "Order was successfully placed"

    order = Order.all.first
    within ".orders" do
      click_link "Order #{order.id}"
    end

    assert page.has_content? "Vail"
    assert page.has_content? "Outdoor Adventure"
    assert page.has_content? "$50"
  end
end
