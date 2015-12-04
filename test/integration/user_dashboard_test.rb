require "test_helper"

class UserDashboardTest < ActionDispatch::IntegrationTest
  test "user can see their profile information after login/sign up" do
    user_creates_account

    assert_equal dashboard_path, current_path
    assert page.has_content?("TestUser2")
    assert page.has_content?("1337 S. Cool St.")
    assert page.has_content?("Denver")
    assert page.has_content?("USA")
    assert page.has_content?("CO")

    click_button("Update Profile")

    fill_in("City:", with: "Lakewood")
    fill_in("State:", with: "CA")
    fill_in("Country:", with: "Japan")

    click_on("Update Profile")

    assert_equal dashboard_path, current_path

    assert page.has_content?("Lakewood")
    assert page.has_content?("CA")
    assert page.has_content?("Japan")
    assert page.has_content?("1337 S. Cool St.")

    refute page.has_content?("Denver")
    refute page.has_content?("USA")
    refute page.has_content?("CO")
  end
end
