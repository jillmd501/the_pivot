require "test_helper"

class AdminUserDashboardTest < ActionDispatch::IntegrationTest
  test "business admin has a dashboard" do
    skip
    business_admin_creates_account
    user_logs_in(@business_admin)
    visit login_path
    visit business_admin_dashboard_path

    assert page.has_content? "Business Admin Dashboard"
  end

  test "registered user receives 404 on business admin dashboard" do
    skip
    user_creates_account
    user_logs_in(@user)
    visit business_admin_dashboard_path

    assert page.has_content? "404"
  end

  test "visitor receives 404 on admin dashboard" do
    skip
    visit business_admin_dashboard_path

    assert page.has_content? "404"
  end

  test "platform admin has a dashboard" do
    skip
    platform_admin_creates_account
    user_logs_in(@platform_admin)
    visit login_path
    visit platform_admin_dashboard_path

    assert page.has_content? "Platform Admin Dashboard"
  end
end
