require "test_helper"

class CityTest < ActiveSupport::TestCase
  def valid_city
    City.new(name: "Vail",
             image_path: "vail.jpg")
  end

  def new_trip
    Trip.new(name: "Outdoor Adventure",
             price: 50,
             description: "Wow!",
             image_path: "outdoors.jpg")
  end

  test "it is valid" do
    assert valid_city.valid?
  end

  test "it is invalid without a name" do
    city = valid_city
    city.name = nil

    refute city.valid?
  end

  test "it is invalid without a unique name" do
    valid_city.save

    refute valid_city.valid?
  end

  test "it is invalid without an image_path" do
    city = valid_city
    city.image_path = nil

    refute city.valid?
  end

  test "it has trips" do
    city = valid_city
    city.trips << new_trip

    assert_equal new_trip.name, city.trips.first.name
  end
end
