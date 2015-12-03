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
end
