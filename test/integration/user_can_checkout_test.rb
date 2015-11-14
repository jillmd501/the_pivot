require 'test_helper'

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  # Background: An existing user and a cart with items
  # As a visitor
  # When I visit "/cart"
  # And I click "Checkout"
  # Then I should be required to login


  # When I am logged in
  # And I visit "/cart"
  # And I click "Checkout"
  # Then the order should be placed
  # And my current page should be "/orders"
  # And I should see a message "Order was successfully placed"
  # And I should see the order I just placed in a table

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
    user_adds_trip_to_cart(trip)

    visit cart_path
    click_link "Checkout"

    assert_equal orders_path, current_path
    assert page.has_content? "Order was successfully placed"

    within ".orders" do
      assert page.has_content? "Vail"
      assert page.has_content? "Outdoor Adventure"
      assert page.has_content? "$50"
      assert page.has_content? "Wow!"
    end
  end
end
