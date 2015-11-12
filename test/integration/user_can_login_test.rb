require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test 'existing user can login' do
      login_user

      assert page.has_content?("Welcome, BikeBro!")
    end

  test 'guest cannot login when unregistered' do
    visit login_path

    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"

    click_button "Login"

    assert page.has_content?("Invalid")
  end

  test 'registered user cannot login with incorrect password' do
    User.create(username: "BikeBro",
                password: "password")
    visit login_path

    fill_in "Username", with: "BikeBro"
    fill_in "Password", with: "hello"

    click_button "Login"

    assert page.has_content?("Invalid")
  end

  test 'authenticated user can logout' do
    login_user

    assert page.has_content?("Welcome, BikeBro!")

    click_link "Logout"

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Login")
  end

  def login_user
    User.create(username: "BikeBro",
                password: "password")

    visit login_path

    fill_in "Username", with: "BikeBro"
    fill_in "Password", with: "password"

    click_button "Login"
  end
end
