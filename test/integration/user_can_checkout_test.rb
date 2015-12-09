require "test_helper"

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  def checkout
    visit business_photo_path(business_name: @business.slug, identifier: @photo.slug)
    within("#photo_#{@photo.id}") do
      find(".size-select").find(:xpath, 'option[2]').select_option
      click_on "Add to Cart"
    end
    visit cart_path
    click_button "Checkout"
  end

  test "visitor cannot checkout" do
    checkout

    assert_equal login_path, current_path
  end

  test "user with cart can check out" do
    user = create_user
    user_logs_in(user)

    assert page.has_content? "Welcome, dude"
    checkout
    click_on "My Account"
    click_button "Order History"
    assert_equal orders_path, current_path

    order = user.orders.first
    within ".orders" do
      click_link "Order #{order.id}"
    end

    assert page.has_content? "Ross's Baby Pic"
  end
end
