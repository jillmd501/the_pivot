require "test_helper"

class GuestCanSeePhotosInABusinessTest < ActionDispatch::IntegrationTest
  test "guest can see photos within a business" do
    visit businesses_path

    assert page.has_content?("Businesses")
    assert page.has_content?("Photography")

    click_link "Photography"

    assert_equal current_path, business_path(@business.id)
    click_button "Photos"

    assert_equal current_path, business_photos_path(@business.id)
    assert page.has_content?("All Photos")
  end
end
