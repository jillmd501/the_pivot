require "test_helper"

class GuestCanSeePhotosInABusinessTest < ActionDispatch::IntegrationTest
  test "guest can see photos within a business" do
    visit businesses_path

    assert page.has_content?("Businesses")
    assert page.has_content?("Photography")

    first(:link, "UnsafePond Photography").click

    assert_equal current_path, business_path(@business.slug)
    click_button "Photos"

    assert_equal current_path, business_photos_path(@business.slug)
    assert page.has_content?("All Photos")
  end

  test "guest can view all photos" do
    visit root_path

    click_link "Photos"

    assert page.has_content?("All Photos")
    assert photos_path, current_path

  end
end
