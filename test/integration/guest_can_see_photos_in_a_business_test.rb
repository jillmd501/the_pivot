require "test_helper"

class GuestCanSeePhotosInABusinessTest < ActionDispatch::IntegrationTest
  test "guest can see photos within a business" do
    business = create_business
    create_photo
    visit businesses_path

    assert page.has_content?("Businesses")
    assert page.has_content?("UnsafePond")

    click_link "UnsafePond"

    assert_equal business_path(business.id), current_path
    assert page.has_content?("All Photos")
    assert page.has_content?("Pond")
    assert page.has_content?("Price: $2000")
  end
end
