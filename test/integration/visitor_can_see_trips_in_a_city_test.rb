require "test_helper"

class VisitorCanSeeTripsInACityTest < ActionDispatch::IntegrationTest
  test 'visitor can see trips within a city' do
    city = City.create(name: "Vail",
                       image_path: "vail.jpeg")
    city.trips.create(name: "Outdoor Adventure",
                      description: "Oh so fun!",
                      price: 125,
                      image_path: "www.biking.jpeg")

    visit cities_path

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")

    click_link "Vail"

    assert page.has_content?("Vail Tours")
    assert page.has_content?("Outdoor Adventure")
    assert page.has_content?("Oh so fun!")
    assert page.has_content?("Price: $125")
  end
end
