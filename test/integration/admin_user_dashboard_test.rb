require "test_helper"

class AdminUserDashboardTest < ActionDispatch::IntegrationTest
  test "Admin has dashboard" do
  admin_creates_account
  admin_logs_in

  visit login_path

  visit admin_dashboard_index_path

  assert page.has_content? "Admin Dashboard"
  end

  test "registered user receives 404 on admin dashboard" do
    user_creates_account
    user_logs_in

    visit admin_dashboard_index_path

    assert page.has_content? "404"
  end

  test "visitor receives 404 on admin dashboard" do
    visit admin_dashboard_index_path

    assert page.has_content? "404"
  end
end
