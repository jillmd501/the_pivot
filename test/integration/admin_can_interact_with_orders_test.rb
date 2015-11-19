require "test_helper"

class AdminCanInteractWithOrdersTest < ActionDispatch::IntegrationTest
  def setup
    admin_creates_account
    ApplicationController.any_instance.stubs(:current_user).returns(@admin)
    create_city
    trip = create_trip(@city)
    @cart_trip = CartTrip.new(trip, 1, 100)
  end

  def create_orders_with_statuses(statuses)
    statuses.count.times do |n|
      order = Order.new(status: statuses[n],
                        total: 100,
                        status_timestamp: "January 1st, 2016")
      order.order_trips.new(trip_id: @cart_trip.id,
                            subtotal: @cart_trip.subtotal,
                            quantity: @cart_trip.quantity)
      order.save
    end
  end

  test "admin can view orders" do
    statuses = %w(Ordered Paid Cancelled Completed)
    create_orders_with_statuses([0, 1, 2, 3])
    orders = Order.all
    visit dashboard_path

    statuses.inject(0) do |n, status|
      within ".#{status}" do
        assert page.has_link? "Order ##{orders[n].id}"
      end
      n += 1
    end
    assert page.has_content? "Total: 1"
  end

  test "admin can cancel orders" do
    create_orders_with_statuses([0])
    visit dashboard_path

    within ".Ordered" do
      assert page.has_link? "Cancel"

      click_link "Cancel"

      assert_equal "Cancelled", Order.all.first.status
    end
  end

  test "admin cannot cancel cancelled orders" do
    create_orders_with_statuses([2])
    visit dashboard_path

    within ".Cancelled" do
      refute page.has_link? "Cancel"
    end
  end

  test "admin can mark ordered orders as paid" do
    create_orders_with_statuses([0])
    visit dashboard_path

    within ".Ordered" do
      assert page.has_link? "Mark as Paid"

      click_link "Mark as Paid"

      assert_equal "Paid", Order.all.first.status
    end
  end

  test "admin can mark paid orders as completed" do
    create_orders_with_statuses([1])
    visit dashboard_path

    within ".Paid" do
      assert page.has_link? "Mark as Completed"

      click_link "Mark as Completed"

      assert_equal "Completed", Order.all.first.status
    end
  end
end
