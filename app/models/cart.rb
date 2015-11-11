class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_trip(trip_id)
    contents[trip_id.to_s] ||= 0
    contents[trip_id.to_s] += 1
  end

  def total
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
      CartTrip.new(trip, quantity)
    end
  end

  def total_price
    # implement
  end
end

# class CartTrip #look into SimpleDelegator
#   def initialize(trip, quantity)
#     @trip = trip
#     @quantity = quantity
#   end
# end
#

# views
#
# @cart.trips.each do |cart_trip|
#   cart_trip.trip.name
#
# end


# @categories = []
# @total = 0
# @cart.contents.each do |category_id, count|
#   category = Category.find(category_id)
#   @categories << [category, count]
#   @total += category.price * count
# end
