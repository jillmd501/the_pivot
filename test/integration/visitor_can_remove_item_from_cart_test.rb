require 'test_helper'

class VisitorCanRemoveItemFromCartTest < ActionDispatch::IntegrationTest
  # Background: My cart has an item in it
  # As a visitor
  # When I visit "/cart"
  # And I click link "Remove"
  # Then my current page should be "/cart"
  # And I should see a message styled in green
  # And the message should say "Successfully removed SOME_ITEM from your cart."
  # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
  # And I should not see the item listed in cart

  def visitor_adds_item_to_cart
    city = City.create(name: "Vail",
                       image_path: "www.vail.jpeg")

    city.categories.create(name: "Outdoor fun",
                           price: 100,
                           description: "biking",
                           image_path: "www.biking.jpeg")

    visit city_categories_path(city)

    click_button "Add to Cart"
  end

  test "visitor can remove item from cart" do
    visitor_adds_item_to_cart

    assert page.has_content? "My Trips (1)"

    visit cart_path
    click_button "Remove"

    assert_equal cart_path, current_path
    assert page.has_content? "Successfully removed Outdoor fun from your cart."

    assert page.has_content? "My Trips (0)"
    assert page.has_link? "Outdoor fun"
  end

end
