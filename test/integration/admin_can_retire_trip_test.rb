require 'test_helper'

class AdminCanRetireTripTest < ActionDispatch::IntegrationTest
  test 'admin can retire trip' do
    admin_creates_account
    user_logs_in(@admin)
    create_city
    trip = create_trip(@city)

    click_link "View All Trips"

    assert page.has_content? "Outdoor fun"

    within("#outdoor-fun") do
      assert_equal "Active", trip.status
      click_link "Retire"
    end

    assert_equal admin_trips_path, current_path
    assert_equal "Retired", Trip.all.first.status
  end
end
