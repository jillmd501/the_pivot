require "test_helper"

class VisitorCanAddTripToCartTest < ActionDispatch::IntegrationTest
  test "visitor can add trip to cart" do
    city = City.create(name: "Vail",
                       image_path: "www.vail.jpeg",
                       short_d: "short",
                       long_d: "long")

    city.trips.create(name: "Outdoor fun",
                      price: 100,
                      description: "biking",
                      image_path: "www.biking.jpeg")

    visit city_trips_path(city)

    assert page.has_content?("My Trips (0)")

    click_link "Add to Cart"

    assert page.has_content?("My Trips (1)")

    click_link "My Trips (1)"

    assert_equal cart_path, current_path
    assert page.has_content?("Outdoor fun")
    assert page.has_content?("biking")
    assert page.has_content?("Total: $100")
  end
end
