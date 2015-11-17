require "test_helper"

class AdminCanInteractWithOrdersTest < ActionDispatch::IntegrationTest
  # As an Admin
  # When I visit the dashboard
  # Then I can see a listing of all orders
  # And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
  # And I can see a link for each individual order

  # And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")

  # And I have links to transition the status
  # - I can click on "cancel" on individual orders which are "paid" or "ordered"
  # - I can click on "mark as paid" on orders that are "ordered"
  # - I can click on "mark as completed" on orders that are "paid"
  def setup
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    city = City.create(name: "Vail",
                       image_path: "vail.jpg")
    trip = city.trips.create(name: "Race the Pass",
                             price: 100,
                             description: "Woosh!",
                             image_path: "race.jpg")
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
      within ".#{status}-table" do
        assert page.has_link? "Order ##{orders[n].id}"
        assert page.has_content? "Total: 1"
        n += 1
      end
    end
  end

  test "admin can cancel orders" do
    create_orders_with_statuses([0])
    visit dashboard_path

    within ".Ordered-table" do
      assert page.has_link? "Cancel"
      click_link "Cancel"

      assert_equal "Cancelled", Order.all.first.status
    end
  end

  test "admin cannot cancel cancelled orders" do
    create_orders_with_statuses([2])
    visit dashboard_path

    within ".Cancelled-table" do
      refute page.has_link? "Cancel"
    end
  end

  test "admin can mark ordered orders as paid" do
    create_orders_with_statuses([0])
    visit dashboard_path

    within ".Ordered-table" do
      assert page.has_link? "Mark as Paid"
      click_link "Mark as Paid"

      assert_equal "Paid", Order.all.first.status
    end
  end

  test "admin can mark paid orders as completed" do
    create_orders_with_statuses([1])
    visit dashboard_path

    within ".Paid-table" do
      assert page.has_link? "Mark as Completed"
      click_link "Mark as Completed"

      assert_equal "Completed", Order.all.first.status
    end
  end

  test "admin can filter orders by status type" do
    skip
  end
end
