require "test_helper"

class AdminUpdateBusinessInfoTest < ActionDispatch::IntegrationTest
  test "admin can update business info" do
    user_logs_in(platform_admin_creates_account)
    @platform_admin.businesses << @business

    visit admin_dashboard_path

    refute page.has_content?("Cool")

    click_on "Edit Business"

    assert_equal edit_admin_business_path(name: @business.slug), current_path

    fill_in "Name", with: "Cool"
    fill_in "Location", with: "Stuff"
    fill_in "Bio", with: "Things"
    click_on "Update Information"

    assert_equal admin_dashboard_path, current_path

    business = Business.find_by(name: "Cool")

    assert page.has_content?("Cool")

    assert_equal business.id, @business.id
  end

  test "invalid business info" do
     user_logs_in(platform_admin_creates_account)
    @platform_admin.businesses << @business

    visit admin_dashboard_path

    click_on "Edit Business"

    assert_equal edit_admin_business_path(name: @business.slug), current_path

    fill_in "Name", with: ""
    fill_in "Location", with: ""
    fill_in "Bio", with: ""
    click_on "Update Information"

    assert page.has_content? "Something went wrong! ໒( ･ Ĺ̯ ･ )७"
  end

end
