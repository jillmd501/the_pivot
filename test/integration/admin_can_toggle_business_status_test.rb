require "test_helper"

class AdminOrdersTest < ActionDispatch::IntegrationTest
  test "admin can take a business offline" do
    user_logs_in(platform_admin_creates_account)
    @platform_admin.businesses << @business

    visit admin_dashboard_path
    first(:button, "Offline").click
    assert_equal admin_dashboard_path, current_path
    within("#business_#{@business.id}") do
      assert page.has_button?("Online")
    end
  end

  test "admin can take a business online" do
    user_logs_in(platform_admin_creates_account)
    @platform_admin.businesses << @business

    visit admin_dashboard_path
    first(:button, "Offline").click
    within("#business_#{@business.id}") do
      first(:button, "Online").click
    end
    within("#business_#{@business.id}") do
      assert page.has_button?("Offline")
    end
  end
end
