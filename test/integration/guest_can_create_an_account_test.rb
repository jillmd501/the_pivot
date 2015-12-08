require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test 'guest can create account' do
    visit new_user_path

    fill_in "Username", with: "unsafepond"
    fill_in "Password", with: "password"
    fill_in "Email", with: "unsafe@pond.com"
    fill_in "First name", with: "Unsafe"
    fill_in "Last name", with: "Pond"

    click_button "Create Account"

    assert page.has_content?("Welcome, Unsafe")
  end

  test 'guest missing information will receive a flash message test' do
    visit new_user_path

    fill_in "Username", with: ""
    fill_in "Password", with: "password"
    fill_in "Email", with: "unsafe@pond.com"
    fill_in "First name", with: "Unsafe"
    fill_in "Last name", with: "Pond"

    click_button "Create Account"

    assert page.has_content?("Invalid Login")
  end
end
