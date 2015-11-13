class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_trip(trip_id)
    contents[trip_id.to_s] ||= 0
    contents[trip_id.to_s] += 1
  end

  def total_count
    contents.values.sum
  end

  def remove(trip_id)
    contents.delete(trip_id.to_s)
  end

  def update(trip_id, update_type)
    if update_type == "add"
      contents[trip_id.to_s] += 1
    else
      contents[trip_id.to_s] -= 1
    end
    remove(trip_id) if contents[trip_id.to_s] == 0
  end

  def trips
    contents.map do |trip_id, quantity|
      trip = Trip.find(trip_id)
      subtotal = trip.price * quantity
      CartTrip.new(trip, quantity, subtotal)
    end
  end

  def total_cost
    trips.map do |cart_trip|
      cart_trip.price * cart_trip.quantity
    end.reduce(:+)
  end
end
