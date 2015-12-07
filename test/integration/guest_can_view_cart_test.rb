require 'test_helper'

class GuestCanAddPhotoToCartTest < ActionDispatch::IntegrationTest
  test 'guest can add photos to cart' do
    visit root_path

    assert page.has_link? "Login"

    click_link "Create Account"

    assert_equal current_path, new_user_path
    assert page.has_content? "Create Account"

    fill_in "Username", with: "Jill"
    fill_in "Password", with: "password"
    first(:link, "Create Account").click
    visit business_photo_path(@business, @photo)
    within("#photo_#{@photo.id}") do
      find(".size-select").find(:xpath, 'option[2]').select_option
      click_on "Add to Cart"
    end

    find("#cart-link").click
    assert_equal cart_path, current_path
    assert page.has_content?("Ross's Baby Pic")
  end
end
