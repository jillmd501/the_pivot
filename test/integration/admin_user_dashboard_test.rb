require "test_helper"

class AdminUserDashboardTest < ActionDispatch::IntegrationTest
  test "business admin has a dashboard" do
    business_admin = business_admin_creates_account
    user_logs_in(business_admin)
    visit login_path
    visit admin_dashboard_path

    assert page.has_content? "Admin Dashboard"
  end

  test "registered user receives error on business admin dashboard" do
    user = create_user
    user_logs_in(user)
    visit admin_dashboard_path

    assert page.has_content? "I don't know you!"
  end

  test "visitor receives 404 on admin dashboard" do
    visit admin_dashboard_path

    assert page.has_content? "I don't know you!"
  end

  test "platform admin has a dashboard" do
    platform_admin = platform_admin_creates_account
    user_logs_in(platform_admin)
    visit login_path
    visit admin_dashboard_path

    assert page.has_content? "Admin Dashboard"
  end
end
