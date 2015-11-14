require 'test_helper'

class VisitorCanAdjustQuantityOfItemInCartTest < ActionDispatch::IntegrationTest
  test "visitor can adjust the quantity of item in cart" do
    visitor_adds_trip_to_cart
    visit cart_path

    assert page.has_content? "My Trips (1)"

    click_link "+"

    assert_equal cart_path, current_path

    within '#Outdoor_fun_quantity' do
      assert page.has_content? "2"
    end

    assert page.has_content? "Total: $200"

    click_link "-"

    assert_equal cart_path, current_path

    within "#Outdoor_fun_quantity" do
      assert page.has_content? "1"
    end

    assert page.has_content? "Total: $100"
  end
end
