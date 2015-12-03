require "test_helper"

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "user can see their profile information after login/sign up" do
    user_creates_account

    assert_equal dashboard_path, current_path
    assert page.has_content?("Welcome, TestUser2!")
    assert page.has_content?("1337 S. Cool ST.")
    assert page.has_content?("Denver")
    assert page.has_content?("United States")
    assert page.has_content?("CO")
  end
end
