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
    visit cart_path
    
  end
end
