require "test_helper"

class UserDashboardTest < ActionDispatch::IntegrationTest
  test "user can see their profile information after login/sign up" do
    user = create_user
    user_logs_in(user)

    assert_equal dashboard_path, current_path
    assert page.has_content?("TestUser")

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

  test "user can update their profile" do
    user = create_user
    user_logs_in(user)

    assert_equal dashboard_path, current_path
    assert page.has_content?("TestUser")

    click_button("Update Profile")

    fill_in("Password", with: "")
    fill_in("First name", with: "ss")
    fill_in("Last name", with: "Ert")
    fill_in("Email", with: "")

    click_on("Update Profile")

    assert page.has_content?("ʕ ಡ ﹏ ಡ ʔ")
  end
end
