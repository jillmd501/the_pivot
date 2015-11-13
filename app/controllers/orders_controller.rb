class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_trips = @order.order_trips.map do |order_trip|
      CartTrip.new(order_trip.trip, order_trip.quantity, order_trip.subtotal)
    end
  end
end
