require "test_helper"

class AdminCanViewCategoriesTest < ActionDispatch::IntegrationTest
  test "business admin has a dashboard" do
    business_admin = business_admin_creates_account
    user_logs_in(business_admin)
    visit login_path

    click_on "Businesses"

    assert page.has_content?("Categories")

    first(:link, "silly").click

    assert page.has_content?("silly")
  end
end
