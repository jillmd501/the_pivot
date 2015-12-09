require "test_helper"

class AdminOrdersTest < ActionDispatch::IntegrationTest
  def checkout
    visit business_photo_path(business_name: @business.slug, identifier: @photo.slug)
    within("#photo_#{@photo.id}") do
      find(".size-select").find(:xpath, 'option[2]').select_option
      click_on "Add to Cart"
    end
    visit cart_path
    click_button "Checkout"
  end

  test "business admin has a dashboard" do
    business_admin = business_admin_creates_account
    user_logs_in(business_admin)
    checkout
    visit orders_path

    assert page.has_content? "Placed"
    refute page.has_content? "Cancelled"

    click_on "Cancel"

    assert page.has_content? "Cancelled"
  end
end
