class CartTrip # Simple Delegator

  # CartTrip.name
  # CartTrip.description
  # CartTrip.price
  attr_reader :quantity

  def initialize(trip, quantity)
    @trip = trip
    @quantity = quantity
  end

  def image_path
    @trip.image_path
  end

  def name
    @trip.name
  end

  def description
    @trip.description
  end

  def price
    @trip.price
  end

  def id
    @trip.id
  end
end
