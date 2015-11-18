require "test_helper"

class TripTest < ActiveSupport::TestCase
  def valid_trip
    Trip.new(name: "Outdoor Adventure",
             price: 50,
             city_id: 1,
             description: "Wow!",
             image_path: "outdoors.jpg")
  end

  def create_city
    City.create(name: "city",
                image_path: "image.jpg",
                short_d: "short",
                long_d: "long")
  end

  test "it is valid" do
    assert valid_trip.valid?
  end

  test "it is invalid without a name" do
    trip = valid_trip
    trip.name = nil

    refute trip.valid?
  end

  test "it is invalid without a unique name" do
    city = create_city
    trip = valid_trip
    trip.city_id = city.id
    trip.save

    refute valid_trip.valid?
  end

  test "it is invalid without a price" do
    trip = valid_trip
    trip.price = nil

    refute trip.valid?
  end

  test "it is invalid without a description" do
    trip = valid_trip
    trip.description = nil

    refute trip.valid?
  end

  test "it is invalid without an image_path" do
    trip = valid_trip
    trip.image_path = nil

    refute trip.valid?
  end

  test "it is invalid without a city_id" do
    trip = valid_trip
    trip.city_id = nil

    refute trip.valid?
  end

  test "it belongs to a city" do
    city = create_city
    trip = valid_trip
    trip.city_id = city.id

    assert_equal city, trip.city
  end
end
