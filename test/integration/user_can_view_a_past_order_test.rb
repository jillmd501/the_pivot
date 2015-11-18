require "test_helper"

class UserCanViewAPastOrder < ActionDispatch::IntegrationTest
  test "user can view a past order" do
    user_creates_account
    user_logs_in(@user)
    user_orders_trips(@user)
    visit orders_path

    assert page.has_link? "Order #{@order.id}"

    click_link "Order #{@order.id}"

    within ".outdoor-fun" do
      assert page.has_link? "Outdoor fun"
      assert page.has_content? "Quantity: 2"
      assert page.has_content? "Subtotal: $200"
    end

    within ".telluride-trek" do
      assert page.has_link? "Telluride Trek"
      assert page.has_content? "Quantity: 1"
      assert page.has_content? "Subtotal: $50"
    end

    assert page.has_content? "Total: $250"
  end

  test "user can view trip information page" do
    user_creates_account
    user_logs_in(@user)
    user_orders_trips(@user)

    visit orders_path
    within ".orders" do
      click_link "Order #{@order.id}"
    end
    click_link "Outdoor fun"

    assert_equal "/cities/vail/trips/outdoor-fun", current_path
    assert page.has_content? "Outdoor fun"
  end

  test "user can cancel an order" do
    OrderCompletion.stubs(:formatted_time).returns("January 1st, 2016")
    user_creates_account
    user_logs_in(@user)
    user_orders_trips(@user)
    visit orders_path

    within ".orders" do
      assert page.has_content? "Order #{@order.id}"
      assert page.has_content? "Ordered"
      assert page.has_content? "January 1st, 2016"
      assert page.has_link? "Cancel"
      click_link "Cancel"
    end

    assert_equal orders_path, current_path

    within ".orders" do
      assert page.has_content? "Order #{@order.id}"
      assert page.has_content? "Cancelled"
      assert page.has_content? "January 1st, 2016"
      refute page.has_link? "Cancel"
    end
  end
end
