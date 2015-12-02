require "test_helper"

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "existing user can login" do
    user_logs_in("user")

    assert_equal dashboard_path, current_path
    assert page.has_content?("Welcome, TestUser!")
  end

  test "guest cannot login when unregistered" do
    visit login_path
    user_logs_in(User.new(username: "guest",
                          password: "password"))

    assert_equal login_path, current_path
    assert page.has_content?("Invalid")
  end

  test "registered user cannot login with incorrect password" do
    visit login_path
    fill_in "Username", with: "TestUser"
    fill_in "Password", with: "hello"
    click_button "Login"

    assert_equal login_path, current_path
    assert page.has_content?("Invalid")
  end

  test "authenticated user can logout" do
    user_logs_in("user")
    click_link "Logout"

    assert page.has_content?("Goodbye!")
    assert page.has_content?("Login")
  end
end
