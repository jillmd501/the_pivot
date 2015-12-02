require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test 'guest can create account' do
    skip
    visit new_user_path
    fill_in "Username", with: "Jill"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Jill!")
  end

  test 'visitor can sign up for account and see photos in cart and sign out' do
    skip
    
    visit root_path

    assert page.has_link? "Login"

    click_link "Create Account"

    assert_equal new_user_path, current_path
    assert page.has_content? "Create Account"

    fill_in "Username", with: "Jill"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content? "Welcome"
    refute page.has_content? "Login"
    assert page.has_link? "Logout"

    visitor_adds_photo_to_cart

    assert page.has_content? "My Photos (1)"

    click_link "Logout"

    assert page.has_link? "Login"
    refute page.has_content? "Logout"
  end
end
