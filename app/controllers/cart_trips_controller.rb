class CartTripsController < ApplicationController
  def create
    @cart.add_trip(params[:trip_id])
    session[:cart] = @cart.contents
    redirect_to city_trips_path(params[:city_id])
  end

  def index
    @trips = []
    @total = 0
    @cart.contents.each do |trip_id, count|
      trip = Trip.find(trip_id)
      @trips << [trip, count]
      @total += trip.price * count
    end
  end

  def destroy
    @cart.remove(params[:trip_id])
    trip = Trip.find(params[:trip_id])
    flash[:notice] = "Successfully removed
      #{view_context.link_to(trip.name,
      city_trips_path(trip.city_id),
      {:style=>'color:#00FF00;', :class => "css_class"})} from your cart."
    redirect_to cart_path
  end
end
