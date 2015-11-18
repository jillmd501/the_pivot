require "test_helper"

class CartTripTest < ActiveSupport::TestCase
  def setup
    create_city
    @trip = create_trip(@city)
    @cart_trip = CartTrip.new(@trip, 2, 100)
  end

  test "it has a name" do
    assert_equal @trip.name, @cart_trip.name
  end

  test "it has a price" do
    assert_equal @trip.price, @cart_trip.price
  end

  test "it has a description" do
    assert_equal @trip.description, @cart_trip.description
  end

  test "it has an image_path" do
    assert_equal @trip.image_path, @cart_trip.image_path
  end

  test "it has a quantity" do
    assert_equal 2, @cart_trip.quantity
  end

  test "it has a subtotal" do
    assert_equal 100, @cart_trip.subtotal
  end
end
