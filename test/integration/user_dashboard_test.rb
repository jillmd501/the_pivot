require "test_helper"

class UserDashboardTest < ActionDispatch::IntegrationTest
  test "user can see their profile information after login/sign up" do
    user_creates_account

    assert_equal dashboard_path, current_path
    assert page.has_content?("TestUser2")

    click_button("Update Profile")

    fill_in("Password", with: "a_new_password")
    fill_in("First name", with: "Ross")
    fill_in("Last name", with: "Edfort")
    fill_in("Email", with: "a_new_email@whatever.com")

    click_on("Update Profile")

    assert_equal dashboard_path, current_path

    assert page.has_content?("Ross")
    assert page.has_content?("Edfort")
    assert page.has_content?("a_new_email@whatever.com")

    refute page.has_content?("dude")
    refute page.has_content?("dudezzz")
  end
end
