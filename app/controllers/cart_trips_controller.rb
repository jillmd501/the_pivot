class CartTripsController < ApplicationController
  def create
    @cart.add_trip(params[:trip_id])
    session[:cart] = @cart.contents
    redirect_to city_trips_path(params[:city_id])
  end

  def index
  end

  def update
    @cart.update(params[:id], params[:update_type])
    redirect_to cart_path
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    @cart.remove(trip.id)
    flash[:notice] = @cart.remove_notice(trip)
    redirect_to cart_path
  end
end
