require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test 'guest can create account' do

    visit new_user_path

    fill_in "Username", with: "BikeBro"
    fill_in "Password", with: "password"

    click_button "Create Account"

    assert page.has_content?("Welcome, BikeBro!")
  end

    # When I visit "/"
    # Then I should see a link for "Login"
    # And when I click link "Create Account"
    # Then my current page should be "/dashboard"
    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    # And I should see my profile information
    # And I should not see a link for "Login"
    # And I should see a link for "Logout"
    # And when I visit "/cart"
    # Then I should see all of the data that was there when I was not logged in
    # When I click "Logout"
    # Then I should see see "Login"
    # And I should not see "Logout"
  test 'visitor can sign up for account and see trips in cart and sign out' do

    visit root_path

    assert page.has_link? "Login"

    click_link "Create Account"

    assert_equal new_user_path, current_path

    assert page.has_content? "Create Account"

    fill_in "Username", with: "BikeBro"
    fill_in "Password", with: "password"

    click_button "Create Account"

    assert page.has_content? "Welcome"

    refute page.has_content? "Login"

    assert page.has_link? "Logout"

    visitor_adds_trip_to_cart

    assert page.has_content? "My Trips (1)"

    assert page.has_content? "Outdoor fun"

    click_link "Logout"

    assert page.has_link? "Login"

    refute page.has_content? "Logout"
  end
end
