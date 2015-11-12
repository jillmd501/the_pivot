require "test_helper"

class UserCanViewPastTrips < ActionDispatch::IntegrationTest
# Background: An existing user that has multiple orders (multiple ordered trips)
# As an Authenticated User
# When I visit "/orders"
# Then I should see all orders belonging to me
  def user_orders_trips
    user = User.create(username: "BikeBro",
                       password: "password")
    city = City.create(name: "Vail",
                       image_path: "Vail.jpg")

    trip = city.trips.create(name: "Outdoor Adventure",
                             description: "Oh so fun!",
                             price: 125,
                             image_path: "www.biking.jpeg"))
    other_trip = city.trips.create(name: "Telluride Trek",
                                   description: "Wow!",
                                   price: 70,
                                   image_path: "telluride.jpg")
    # user.orders.create(quantity: 1)
    # user.orders.create(quantity: 2)
  end

  def user_logs_in
    visit login_path
    fill_in "Username", with: "BikeBro"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test 'user can view past trips' do
    user_orders_trips
    user_logs_in

    visit "/orders"

    assert page.has_content "Outdoor Adventure"
    assert page.has_content "Telluride Treck"

    # etc
  end
end
