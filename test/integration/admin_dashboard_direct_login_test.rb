require "test_helper"

class AdminDashboardDirectLoginTest < ActionDispatch::IntegrationTest
  test "admin can login to admin dashboard" do
    admin_creates_account
    user_logs_in(@admin)

    assert_equal admin_dashboard_path, current_path
    assert page.has_content? "Admin Dashboard"
  end
end
