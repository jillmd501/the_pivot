require "test_helper"

class GuestCanSeePhotosInABusinessTest < ActionDispatch::IntegrationTest
  test "guest can see photos within a business" do
    business = create_business
    create_photo(business)

    visit businesses_path

    assert page.has_content?("Businesses")
    assert page.has_content?("UnsafePond")

    click_link "UnsafePond"

    assert_equal current_path, business_path(business.id)
    click_button "Shop Now"

    assert_equal current_path, business_photos_path(business.id)
    assert page.has_content?("All Photos")
    assert page.has_content?("Pond")
    assert page.has_content?("Price: $2000")
  end
end
