require "test_helper"

class VisitorCanSeeTripsInACityTest < ActionDispatch::IntegrationTest
  test "visitor can see trips within a city" do
    create_city
    trip = create_trip(@city)
    visit cities_path

    assert page.has_content?("Choose Your Adventure")
    assert page.has_content?("Vail")

    click_link "Vail"

    assert_equal city_trips_path(@city), current_path
    assert page.has_content?("Vail Tours")
    assert page.has_content?("Outdoor fun")
    assert page.has_content?("biking")
    assert page.has_content?("Price: $100")
  end

  test "visitor can see information about a trip" do
    create_city
    trip = create_trip(@city)
    visit cities_path
    click_link "Vail"

    within ".outdoor-fun" do
      click_link "Learn More"
    end

    assert page.has_content? "biking"
    assert page.has_link? "Return to Trips"
  end
end
