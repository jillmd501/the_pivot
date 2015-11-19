require 'test_helper'

class AdminCanCrudTripsTest < ActionDispatch::IntegrationTest
  test 'admin can create and see trips' do
    admin_creates_account
    user_logs_in(@admin)
    create_city

    assert page.has_content? "Admin Dashboard"

    assert page.has_link? "View All Trips"
    assert page.has_link? "View All Cities"

    click_link_or_button "View All Cities"

    assert page.has_content? "List of Available Cities"
    assert page.has_link? "Create a City"
    assert page.has_content? "Vail"

    click_link_or_button "Create a City"

    assert page.has_content? "Create a City"

    fill_in "Name", with: "Parker"
    fill_in "Image path", with: "city_imagepath.jpeg"
    fill_in "Short d", with: "This is a short description"
    fill_in "Long d", with: "This is a longer description"

    click_link_or_button "Create City"

    assert_equal admin_cities_path, current_path
  end

  test 'admin can edit existing trip' do
    admin_creates_account
    user_logs_in(@admin)
    city = create_city
    create_trip(city)

    assert page.has_content? "Admin Dashboard"

    click_link "View All Trips"

    assert page.has_content? "All Trips"

    assert page.has_link? "Edit"

    click_link "Edit"

    fill_in "Name", with: "Roller blading"
    fill_in "Description", with: "This is a trip description"
    fill_in "Price", with: 120
    fill_in "Image path", with: "trips_imagepath.jpeg"

    click_button "Update Trip"

    assert_equal admin_trips_path, current_path

    assert page.has_content? "Roller blading"
  end

  test "admin can view existing trips" do
    admin_creates_account
    user_logs_in(@admin)
    city = create_city
    create_trip(city)

    click_link "View All Trips"

    assert page.has_content? "Outdoor fun"
    assert page.has_content? "Active"
    assert page.has_link? "Edit"
  end
end
