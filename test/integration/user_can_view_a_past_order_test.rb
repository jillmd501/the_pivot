require "test_helper"

class UserCanViewAPastOrder < ActionDispatch::IntegrationTest
  # Background: An existing user that has one previous order
  #     As an authenticated user
  #     When I visit "/orders"
  #     Then I should see my past order
  #     And I should see a link to view that order
  #     And when I click that link
  #     Then I should see each item that was ordered with the quantity and line-item subtotals
  #     And I should see links to each item's show page
  #     And I should see the total price for the order

  #     And I should see the current status of the order (paid, completed, cancelled)
  #     And I should see the date/time that the order was submitted
  #     If the order was completed or cancelled
  #     Then I should see a timestamp when the action took place
  #     And if any of the items in the order were retired (no longer able to be purchased)
  #     Then they should still be able to access the item page
  #     But they should not be able to add the item to their cart

  test 'user can view a past order' do
    user = user_creates_account
    user_logs_in
    user_orders_trips(user)

    visit orders_path

    assert page.has_link? "Order #{@order.id}"

    click_link "Order #{@order.id}"

    within ".outdoor-adventure" do
      assert page.has_link? "Outdoor Adventure"
      assert page.has_content? "Quantity: 2"
      assert page.has_content? "Subtotal: $250"
    end

    within ".telluride-trek" do
      assert page.has_link? "Telluride Trek"
      assert page.has_content? "Quantity: 1"
      assert page.has_content? "Subtotal: $70"
    end

    assert page.has_content? "Total: $320"
  end

  test 'user can view trip information page' do
    user = user_creates_account
    user_logs_in
    user_orders_trips(user)

    visit orders_path

    click_link "Order #{@order.id}"

    click_link "Outdoor Adventure"

    assert page.has_content? "Explore Outdoor Adventure"
  end
end
