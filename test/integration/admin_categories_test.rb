require "test_helper"

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  test "logged in admin sees trips index" do
    admin_creates_account
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)
    visit admin_trips_path

    assert page.has_content?("All Trips")
  end

  test "default user does not see admin trips index" do
    user_creates_account
    ApplicationController.any_instance.stubs(:current_user).returns(@user)
    visit admin_trips_path

    refute page.has_content?("All Trips")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
