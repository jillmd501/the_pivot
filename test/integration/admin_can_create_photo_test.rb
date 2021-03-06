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

    assert page.has_content?("All Photos")

    click_on "Add New Photo"

    assert page.has_content?("Create New Photo")

    fill_in "Name", with: "Jill"
    fill_in "Description", with: "Sleepy"

    click_on "Create Photo"

    assert page.has_content?("Jill")


    assert current_path, admin_business_photo_path(business_name: @business.slug, identifier: @photo.slug)
  end

  test "invalid photo create stuff" do
    business_admin = business_admin_creates_account
    business = create_business
    business_admin.businesses << business
    user_logs_in(business_admin)
    visit login_path
    visit admin_dashboard_path

    click_on "Edit Photo"

    click_on "Add New Photo"

    fill_in "Name", with: ""
    fill_in "Description", with: ""

    click_on "Create Photo"

    assert page.has_content? "༼ ºل͟º ༽"
  end

  test 'admin can edit a photo test' do
    business_admin = business_admin_creates_account
    business_admin.businesses << @business
    user_logs_in(business_admin)
    visit login_path
    visit admin_dashboard_path

    click_on "Edit Photos"

    click_button "Edit"

    assert page.has_content?("Edit Photo")

    fill_in "Name", with: "Hello"
    fill_in "Description", with: "Hello"

    click_on "Update Photo"

    assert current_path, admin_business_photos_path(business_name: @business.slug)
  end

  test 'invalid photo update stuff' do
    business_admin = business_admin_creates_account
    business_admin.businesses << @business
    user_logs_in(business_admin)
    visit login_path
    visit admin_dashboard_path

    click_on "Edit Photos"

    click_button "Edit"

    assert page.has_content?("Edit Photo")

    fill_in "Name", with: ""
    fill_in "Description", with: ""

    click_on "Update Photo"

    assert page.has_content? "Something went wrong! ༼ ºل͟º༼ ºل͟º ༽ºل͟º ༽ºل͟º ༽"
  end

  test 'admin can delete a photo test' do
    business_admin = business_admin_creates_account
    business_admin.businesses << @business
    user_logs_in(business_admin)
    visit login_path
    visit admin_dashboard_path

    click_on "Edit Photos"

    assert page.has_content?("All Photos")

    click_on "Delete"

    refute page.has_content?("Ross's Baby Pic")
  end
end
