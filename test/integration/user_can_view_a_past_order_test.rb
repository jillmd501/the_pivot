require "test_helper"

class UserCanViewAPastOrder < ActionDispatch::IntegrationTest
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
