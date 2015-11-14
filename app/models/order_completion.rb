class OrderCompletion
  def self.create(user, cart)
    order = user.orders.new(total: 0)
    cart.trips.each do |cart_trip|
      order.order_trips.new(trip_id: cart_trip.id,
                            subtotal: cart_trip.subtotal,
                            quantity: cart_trip.quantity)
      order.total += cart_trip.subtotal
    end
    order.save
  end
end
