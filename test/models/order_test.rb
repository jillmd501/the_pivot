require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def valid_order
    Order.new(total: 300)
  end

  def new_order_trip
    OrderTrip.new(quantity: 2,
                  subtotal: 100)
  end

  def new_trip
    Trip.new(name: "Outdoor Adventure")
  end

  test "it is valid" do
    assert valid_order.valid?
  end

  test "it is invalid without a total" do
    order = valid_order
    order.total = nil

    refute order.valid?
  end

  test "it has order_trips" do
    order = valid_order
    order.order_trips << new_order_trip

    assert_equal new_order_trip.subtotal, order.order_trips.first.subtotal
  end
end
