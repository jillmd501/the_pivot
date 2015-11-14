require "test_helper"

class AdminDashboardDirectLoginTest < ActionDispatch::IntegrationTest
  test "admin can login to admin dashboard" do
    admin_creates_account
    admin_logs_in

    assert_equal admin_dashboard_index_path, current_path
    assert page.has_content? "Admin Dashboard"
  end
end
