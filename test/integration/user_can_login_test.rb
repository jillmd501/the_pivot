require "test_helper"

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "existing user can login" do
    user_creates_account
    user_logs_in(@user)

    assert page.has_content?("Welcome, !")
  end

  test "guest cannot login when unregistered" do
    skip
    visit login_path
    user_logs_in(User.new(username: "guest",
                          password: "password"))

    assert page.has_content?("Invalid")
  end

  test "registered user cannot login with incorrect password" do
    skip
    user_creates_account
    visit login_path
    fill_in "Username", with: "BikeBro"
    fill_in "Password", with: "hello"
    click_button "Login"

    assert page.has_content?("Invalid")
  end

  test "authenticated user can logout" do
    skip
    user_creates_account
    user_logs_in(@user)
    click_link "Logout"

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Login")
  end
end
