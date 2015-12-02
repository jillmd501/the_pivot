require "test_helper"

class GuestCanSeePhotosInABusinessTest < ActionDispatch::IntegrationTest
  test "guest can see photos within a business" do
    skip
    
    create_business
    create_photo #need to create this in test helper
    visit businesses_path

    assert page.has_content?("Businesses Index")
    assert page.has_content?("UnsafePond")

    click_link "UnsafePond"

    assert_equal business_photos_path(@business), current_path
    assert page.has_content?("All Photos")
    assert page.has_content?("Pond")
    assert page.has_content?("Price: $100")
  end
end