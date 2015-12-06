require "test_helper"

class VisitorCanRemoveTripFromCartTest < ActionDispatch::IntegrationTest
  def remove_photo
    visit cart_path
    click_link "Remove"
  end

  test "visitor can remove trip from cart" do
    skip
    guest_adds_photo_to_cart

    assert page.has_content? "Added to Cart!"

    remove_photo

    assert_equal cart_path, current_path
  end
end
