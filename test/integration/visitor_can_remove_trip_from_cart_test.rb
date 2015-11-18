require "test_helper"

class VisitorCanRemoveTripFromCartTest < ActionDispatch::IntegrationTest
  def remove_trip
    visit cart_path
    click_link "Remove"
  end

  test "visitor can remove trip from cart" do
    visitor_adds_trip_to_cart

    assert page.has_content? "My Trips (1)"

    remove_trip

    assert_equal cart_path, current_path
    assert page.has_content? "Successfully removed Outdoor fun from your cart."
    assert page.has_content? "My Trips (0)"
    assert page.has_link? "Outdoor fun"
  end

  test "visitor can visit path to trip they just removed" do
    visitor_adds_trip_to_cart

    assert page.has_content? "My Trips (1)"

    remove_trip

    assert page.has_link? "Outdoor fun"

    click_link "Outdoor fun"

    assert_equal city_trips_path(@city), current_path
  end
end
