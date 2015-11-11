require 'test_helper'

class VisitorCanAdjustQuantityOfItemInCartTest < ActionDispatch::IntegrationTest
  # As a visitor
  # When I visit "/cart"
  # Then I should see my item with a number of people as 1
  # And when I increase the quantity
  # Then my current page should be '/cart'
  # And that item's quantity should reflect the increase
  # And the subtotal for that item should increase
  # And the total for the cart should match that increase
  # And when I decrease the quantity
  # Then my current page should be '/cart'
  # And that item's quantity should reflect the decrease
  # And the subtotal for that item should decrease
  # And the total for the cart should match that decrease

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
