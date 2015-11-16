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

    within ".orders" do
      click_link "Order #{@order.id}"
    end
    click_link "Outdoor Adventure"

    assert_equal "/cities/vail/trips/outdoor-adventure", current_path

    assert page.has_content? "Explore Outdoor Adventure"
  end

  test 'user can cancel an order' do
    OrderCompletion.stubs(:formatted_time).returns("January 1st, 2016")

    user = user_creates_account
    user_logs_in
    user_orders_trips(user)
    visit orders_path

    within ".orders" do
      assert page.has_content? "Order #{@order.id}"
      assert page.has_content? "Paid on January 1st, 2016"
      assert page.has_link? "Cancel"
      click_link "Cancel"
    end

    assert_equal orders_path, current_path

    within ".orders" do
      assert page.has_content? "Order #{@order.id}"
      assert page.has_content? "Cancelled on January 1st, 2016"
      refute page.has_link? "Cancel"
    end
  end
end
