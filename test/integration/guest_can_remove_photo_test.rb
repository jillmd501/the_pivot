require "test_helper"

class VisitorCanRemovePhotoFromCartTest < ActionDispatch::IntegrationTest
  def remove_photo
    visit cart_path
    click_link "Remove"
  end

  test "visitor can remove photo from cart" do
    guest_adds_photo_to_cart(@business)

    assert page.has_content? "Added to Cart!"

    remove_photo

    assert_equal cart_path, current_path
  end
end
