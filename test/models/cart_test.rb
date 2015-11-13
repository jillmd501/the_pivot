require "test_helper"

class CartTest < ActiveSupport::TestCase
  def setup
    @cart = Cart.new({})
  end

  test "it has contents" do
    assert @cart.contents
  end

  test "add_trip adds trip with given id to contents" do
    @cart.add_trip(1)
    assert_equal 1, @cart.contents["1"]
  end

  test "total_count counts the quantity of items in cart" do
    @cart.add_trip(1)
    @cart.add_trip(2)

    assert_equal 2, @cart.total_count
  end

  test "remove deletes trip with given id from contents" do
    @cart.add_trip(1)
    assert @cart.contents["1"]

    @cart.remove(1)
    refute @cart.contents["1"]
  end

  test "update increases quantity of trip when given 'add'" do
    @cart.add_trip(1)
    original_qty = @cart.contents["1"]
    @cart.update(1, "add")

    assert_equal (original_qty + 1), @cart.contents["1"]
  end

  test "update decreases quantity of trip when given 'subtract'" do
    @cart.add_trip(1)
    @cart.update(1, "add")
    original_qty = @cart.contents["1"]
    @cart.update(1, "subtract")

    assert_equal (original_qty - 1), @cart.contents["1"]
  end

  test "update removes trip if quantity is reduced to zero" do
    @cart.add_trip(1)
    @cart.update(1, "subrtact")

    refute @cart.contents["1"]
  end

  test "trips returns an array of CartTrips" do
    city = City.create(name: "Vail",
                       image_path: "vail.jpg")
    trip = Trip.create(name: "Outdoor Adventure",
                       price: 50,
                       city_id: city.id,
                       description: "Wow!",
                       image_path: "outdoors.jpg")
    @cart.add_trip(trip.id)
    trips = @cart.trips

    assert trips.all? { |ct| ct.class == CartTrip }
  end

  test "total_cost returns cost of all items in cart" do
    city = City.create(name: "Vail",
                       image_path: "vail.jpg")
    trip = Trip.create(name: "Outdoor Adventure",
                       price: 50,
                       city_id: city.id,
                       description: "Wow!",
                       image_path: "outdoors.jpg")
    @cart.add_trip(trip.id)
    @cart.update(trip.id, "add")

    assert_equal 100, @cart.total_cost
  end
end
