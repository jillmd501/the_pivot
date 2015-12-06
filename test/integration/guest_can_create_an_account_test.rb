require 'test_helper'

class GuestCreatesAccountTest < ActionDispatch::IntegrationTest
  test 'guest can create account' do
    skip
    visit new_user_path
    user_creates_account

    click_button "Create Account"

    assert page.has_content?("Welcome, Jill!")
  end
end
