require "test_helper"

class UserCanCheckoutTest < ActionDispatch::IntegrationTest
  def checkout
    visit business_photos_path(@business)
    click_link "Add to Cart"
    visit cart_path
    click_link "Checkout"
  end

  test "visitor cannot checkout" do
    skip
    checkout

    assert_equal login_path, current_path
  end

  test "user with cart can check out" do
    skip
    user_creates_account
    user_logs_in(@user)
    create_photo

    assert page.has_content? "Welcome, TestUser2"
    click_button "order history"
    assert_equal orders_path, current_path

    order = Order.all.first
    within ".orders" do
      click_link "Order #{order.id}"
    end

    assert page.has_content? "UnsafePond Photography"
  end
end
