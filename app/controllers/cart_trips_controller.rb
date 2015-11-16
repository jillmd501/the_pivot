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
    flash[:notice] = "Successfully removed
      #{view_context.link_to(trip.name,
      city_trips_path(trip.city),
      {:style=>'color:#00FF00;', :class => "css_class"})} from your cart."
    redirect_to cart_path
  end
end
