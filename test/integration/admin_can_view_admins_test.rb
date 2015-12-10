require 'test_helper'

class AdminCanVIewAdminsTest < ActionDispatch::IntegrationTest
  test 'admin can view admins index' do
    business_admin = business_admin_creates_account
    platform_admin = platform_admin_creates_account
    user_logs_in(platform_admin)
    business_admin.businesses << @business
    platform_admin.businesses << @business

    click_link "Admin Dashboard"

    assert page.has_content?("Admin Dashboard")

    click_button "Admins"

    assert page.has_content?("Turd")
  end

  test 'admin can edit an admin' do
    business_admin = business_admin_creates_account
    platform_admin = platform_admin_creates_account
    user_logs_in(platform_admin)
    business_admin.businesses << @business
    platform_admin.businesses << @business

    click_link "Admin Dashboard"
    click_button "Admins"
    click_button "Edit"

    assert page.has_content?("Edit Profile")

    fill_in "First name", with: "Andrew"
    fill_in "Password", with: "password"

    click_on "Update Profile"

    assert admin_business_users_path(@business), current_path
    assert page.has_content?("Andrew")
  end

  test 'invalid admin update attributes' do
    business_admin = business_admin_creates_account
    platform_admin = platform_admin_creates_account
    user_logs_in(platform_admin)
    business_admin.businesses << @business
    platform_admin.businesses << @business

    click_link "Admin Dashboard"
    click_button "Admins"
    click_button "Edit"

    assert page.has_content?("Edit Profile")

    fill_in "First name", with: ""
    fill_in "Password", with: ""

    click_on "Update Profile"
    assert page.has_content?("╰( ◕ ^ ◕ )╯")
  end

  test 'admin can delete other admins' do
    business_admin = business_admin_creates_account
    platform_admin = platform_admin_creates_account
    user_logs_in(platform_admin)
    business_admin.businesses << @business
    platform_admin.businesses << @business

    click_link "Admin Dashboard"
    click_button "Admins"
    click_button "Delete"

    assert page.has_content?("User account has been deactivated")
    refute page.has_content?("Turd")
  end
end
