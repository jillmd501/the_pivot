require 'test_helper'

class AdminCanCreatePhotoTest < ActionDispatch::IntegrationTest
  test 'admin can create a photo test' do
    business_admin = business_admin_creates_account
    business = create_business
    business_admin.businesses << business
    user_logs_in(business_admin)
    visit login_path
    visit admin_dashboard_path

    assert page.has_content?("Admin Dashboard")

    click_on "Edit Photo"
    click_on "Add New Photo"

    assert page.has_content?("Create New Photo")

    fill_in "Name", with: "Jill"
    fill_in "Description", with: "Sleepy"

    click_on "Create Photo"

    assert page.has_content?("Jill")
  end

  test 'admin can edit a photo test' do
    business_admin = business_admin_creates_account
    business = create_business
    business_admin.businesses << business
    user_logs_in(business_admin)
    visit login_path
    visit admin_dashboard_path

    click_on "Edit Photo"
    click_button "Edit"

    assert page.has_content?("Edit Photo")

    click_on "Update Photo"

  end
end
